import 'package:dartz/dartz.dart';
import 'package:test_pokemon/app/_childrens/home/domain/entities/pokemon_entity.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/bloc/poke_list/poke_list_bloc.dart';
import 'package:test_pokemon/app/shared/errors/failures.dart';

abstract class PokeListRepository {
  Future<Either<Failure, List<Model>>> getPokemonsByLimit(
    int limit,
  );

  Future<Either<Failure, List<Model>>> getPokemonsByWord(
    String word,
  );

  Future<Either<Failure, PokemonEntity>> getPokemonByUrl(
    String name,
  );
}
