part of 'poke_detail_bloc.dart';

abstract class PokeDetailEvent extends Equatable {
  const PokeDetailEvent();

  @override
  List<Object> get props => [];
}

class PokeDetailStarted extends PokeDetailEvent {
  const PokeDetailStarted({
    required this.name,
  });

  final String name;

  @override
  List<Object> get props => [name];
}

class PokeDetailSelectedFavorite extends PokeDetailEvent {
  const PokeDetailSelectedFavorite({
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  List<Object> get props => [pokemon];
}
