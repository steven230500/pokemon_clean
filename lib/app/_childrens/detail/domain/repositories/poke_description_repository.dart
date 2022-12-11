import 'package:dartz/dartz.dart';
import 'package:test_pokemon/app/_childrens/home/data/models/pokemon_model.dart';
import 'package:test_pokemon/app/shared/errors/failures.dart';

abstract class PokeDescriptionRepository {
  Future<Either<Failure, String>> getPokemonDescription(PokemonModel pokemon);
}
