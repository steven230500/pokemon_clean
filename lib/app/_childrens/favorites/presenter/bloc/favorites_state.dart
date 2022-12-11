part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoad extends FavoritesState {
  final List<PokemonEntity> pokemon;

  const FavoritesLoad(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}

class FavoritesFailure extends FavoritesState {}
