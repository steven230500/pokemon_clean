import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_pokemon/app/_childrens/home/domain/entities/pokemon_entity.dart';
import 'package:test_pokemon/app/_childrens/home/domain/entities/sprites_entity.dart';
import 'package:test_pokemon/app/_childrens/home/domain/entities/type_entity.dart';
import 'package:test_pokemon/app/ui/module_ui.dart';
import 'package:test_pokemon/module.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(PokemonEntityAdapter());
  Hive.registerAdapter(SpritesEntityAdapter());
  Hive.registerAdapter(TypeEntityAdapter());
  await Hive.openBox<PokemonEntity>('pokemon');

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: UiValues.titleApp,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
