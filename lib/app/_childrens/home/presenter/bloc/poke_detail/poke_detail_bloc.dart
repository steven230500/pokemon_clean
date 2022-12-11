import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:test_pokemon/app/_childrens/home/data/models/pokemon_model.dart';
import 'package:test_pokemon/app/_childrens/home/domain/entities/pokemon_entity.dart';
import 'package:test_pokemon/app/_childrens/home/domain/repositories/poke_repository.dart';

part 'poke_detail_event.dart';
part 'poke_detail_state.dart';

class PokeDetailBloc extends Bloc<PokeDetailEvent, PokeDetailState> {
  PokeDetailBloc(this._repository) : super(PokeDetailInitial()) {
    on<PokeDetailStarted>(_onGetPokemonByUrl);
    on<PokeDetailSelectedFavorite>(_onFavoriteSelect);
  }
  final PokeListRepository _repository;

  void _onGetPokemonByUrl(
    PokeDetailStarted event,
    Emitter<PokeDetailState> emit,
  ) async {
    emit(PokeDetailInitial());

    try {
      final result = await _repository.getPokemonByUrl(event.name);
      emit(PokeDetailLoading());

      result.fold(
        (l) => emit(PokeDetailFailure()),
        (r) async {
          PokemonModel pokemon = r as PokemonModel;

          final pokemonsBox = Hive.box<PokemonEntity>('pokemon');

          if (pokemonsBox.containsKey(pokemon.id)) {
            pokemon = pokemon.copyWith(favorite: true);
          }
          emit(
            PokeDetailLoad(pokemon),
          );
        },
      );
    } catch (e) {
      emit(PokeDetailFailure());
    }
  }

  void _onFavoriteSelect(
    PokeDetailSelectedFavorite event,
    Emitter<PokeDetailState> emit,
  ) async {
    emit(PokeDetailInitial());

    try {
      emit(PokeDetailLoading());

      PokemonModel pokemon = event.pokemon;

      final pokemonsBox = Hive.box<PokemonEntity>('pokemon');
      log('este es1 ${pokemon.id}');

      if (pokemonsBox.containsKey(pokemon.id)) {
        pokemonsBox.delete(pokemon.id);

        pokemon = pokemon.copyWith(favorite: false);
        emit(PokeDetailLoad(pokemon));

        return;
      }
      pokemon = pokemon.copyWith(favorite: true);

      pokemonsBox.put(pokemon.id, pokemon);
      emit(PokeDetailLoad(pokemon));
    } catch (e) {
      emit(PokeDetailFailure());
    }
  }
}
