part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesStarted extends FavoritesEvent {
  const FavoritesStarted();

  @override
  List<Object> get props => [];
}
