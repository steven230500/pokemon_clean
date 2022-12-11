import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_pokemon/app/_childrens/home/data/models/pokemon_model.dart';
import 'package:test_pokemon/app/_childrens/home/domain/entities/pokemon_entity.dart';
import 'package:test_pokemon/app/_childrens/home/domain/repositories/poke_repository.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/bloc/poke_list/poke_list_bloc.dart';
import 'package:test_pokemon/app/shared/errors/exceptions.dart';
import 'package:test_pokemon/app/shared/errors/failures.dart';

class PokeListRepositoryImpl implements PokeListRepository {
  PokeListRepositoryImpl(this.dio);

  final Dio dio;

  @override
  Future<Either<Failure, List<Model>>> getPokemonsByLimit(int limit) async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=0',
      );

      List<Model> result = [];
      for (var element in response.data['results']) {
        result.add(Model(name: element['name'], url: element['url']));
      }
      return Right(result);
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

  @override
  Future<Either<Failure, List<Model>>> getPokemonsByWord(String word) async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon/$word',
      );

      List<Model> result = [];
      result.add(Model(
          name: response.data['name'],
          url: 'https://pokeapi.co/api/v2/pokemon/$word'));
      return Right(result);
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

  @override
  Future<Either<Failure, PokemonEntity>> getPokemonByUrl(String name) async {
    try {
      final response = await dio.get(
        'https://pokeapi.co/api/v2/pokemon/$name',
      );
      return Right(
        PokemonModel.fromJson(response.data),
      );
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
