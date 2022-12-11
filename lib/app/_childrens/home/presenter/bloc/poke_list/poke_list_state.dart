part of 'poke_list_bloc.dart';

abstract class PokeListState extends Equatable {
  const PokeListState();

  @override
  List<Object> get props => [];
}

class PokeListInitial extends PokeListState {}

class PokeListLoading extends PokeListState {}

class PokeListLoad extends PokeListState {
  final List<Model> model;

  const PokeListLoad(this.model);

  @override
  List<Object> get props => [model];
}

class Model {
  final String? name;
  final String? url;

  const Model({
    this.name,
    this.url,
  });
}

class PokeListFailure extends PokeListState {}
