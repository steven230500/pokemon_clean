part of 'poke_list_bloc.dart';

abstract class PokeListEvent extends Equatable {
  const PokeListEvent();

  @override
  List<Object> get props => [];
}

class PokeListStarted extends PokeListEvent {
  const PokeListStarted({
    required this.limitPokemon,
  });

  final int limitPokemon;

  @override
  List<Object> get props => [limitPokemon];
}

class PokeListSearched extends PokeListEvent {
  const PokeListSearched({
    required this.pokemonName,
  });

  final String pokemonName;

  @override
  List<Object> get props => [pokemonName];
}
