import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pokemon/app/_childrens/home/domain/entities/pokemon_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavoritesStarted>(_onGetPokemonByFavorites);
  }
  void _onGetPokemonByFavorites(
    FavoritesStarted event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesInitial());

    final pokemonsBox = Hive.box<PokemonEntity>('pokemon');
    final listPokemon = pokemonsBox.values.toList();

    emit(FavoritesLoading());

    if (pokemonsBox.isEmpty) {
      emit(FavoritesFailure());
    } else {
      emit(FavoritesLoad(listPokemon));
    }
  }
}
