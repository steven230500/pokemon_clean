import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_pokemon/app/_childrens/detail/domain/repositories/poke_description_repository.dart';
import 'package:test_pokemon/app/_childrens/home/data/models/pokemon_model.dart';
import 'package:test_pokemon/app/shared/errors/exceptions.dart';
import 'package:test_pokemon/app/shared/errors/failures.dart';

class PokeDescriptionRepositoryImpl implements PokeDescriptionRepository {
  PokeDescriptionRepositoryImpl(this.dio);

  final Dio dio;

  @override
  Future<Either<Failure, String>> getPokemonDescription(
      PokemonModel pokemon) async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon-species/${pokemon.id}',
      );

      final List<dynamic> flavorText = response.data['flavor_text_entries'];

      return Right(flavorText[0]['flavor_text']);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
