export 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_pokemon/app/_childrens/home/domain/repositories/poke_repository.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/bloc/poke_list/poke_list_bloc.dart';

part 'poke_list_event.dart';
part 'poke_list_state.dart';

class PokeListBloc extends Bloc<PokeListEvent, PokeListState> {
  PokeListBloc(this._repository) : super(PokeListInitial()) {
    on<PokeListStarted>(_onGetLimitPokemon);
    on<PokeListSearched>(_onGetPokemonByname);
  }

  final PokeListRepository _repository;

  String? pokeWord;

  void _onGetLimitPokemon(
    PokeListStarted event,
    Emitter<PokeListState> emit,
  ) async {
    emit(PokeListLoading());

    try {
      final result = await _repository.getPokemonsByLimit(event.limitPokemon);

      result.fold(
        (l) => emit(PokeListFailure()),
        (r) => emit(
          PokeListLoad(r),
        ),
      );
    } catch (e) {
      emit(PokeListFailure());
    }
  }

  void _onGetPokemonByname(
    PokeListSearched event,
    Emitter<PokeListState> emit,
  ) async {
    emit(PokeListLoading());

    try {
      final result = await _repository.getPokemonsByWord(event.pokemonName);

      result.fold(
        (l) => emit(PokeListFailure()),
        (r) => emit(
          PokeListLoad(r),
        ),
      );
    } catch (e) {
      emit(PokeListFailure());
    }
  }
}
