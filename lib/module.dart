import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_pokemon/app/_childrens/detail/data/repositories/poke_description_repository_impl.dart';
import 'package:test_pokemon/app/_childrens/detail/presenter/bloc/poke_description_bloc.dart';
import 'package:test_pokemon/app/_childrens/detail/presenter/page/detail_page.dart';
import 'package:test_pokemon/app/_childrens/favorites/presenter/bloc/favorites_bloc.dart';
import 'package:test_pokemon/app/_childrens/favorites/presenter/favorites_page.dart';
import 'package:test_pokemon/app/_childrens/home/data/repositories/poke_repository_impl.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/bloc/poke_detail/poke_detail_bloc.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/bloc/poke_list/poke_list_bloc.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/page/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<Dio>(
          (i) => Dio(),
        ),
        Bind<PokeListRepositoryImpl>(
          (i) => PokeListRepositoryImpl(
            i<Dio>(),
          ),
        ),
        Bind<PokeDescriptionRepositoryImpl>(
          (i) => PokeDescriptionRepositoryImpl(
            i<Dio>(),
          ),
        ),
        Bind<PokeListBloc>(
          (i) => PokeListBloc(
            i<PokeListRepositoryImpl>(),
          ),
        ),
        Bind<PokeDetailBloc>(
          (i) => PokeDetailBloc(
            i<PokeListRepositoryImpl>(),
          ),
          isSingleton: false,
        ),
        Bind<PokeDescriptionBloc>(
          (i) => PokeDescriptionBloc(
            i<PokeDescriptionRepositoryImpl>(),
          ),
        ),
        Bind<FavoritesBloc>(
          (i) => FavoritesBloc(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: ((context, args) => const HomePage()),
        ),
        ChildRoute(
          '/detail',
          child: ((context, args) => DetailPage(pokemon: args.data)),
        ),
        ChildRoute(
          '/favorite',
          child: ((context, args) => const FavoritePage()),
        ),
      ];
}
