import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_pokemon/app/_childrens/favorites/presenter/bloc/favorites_bloc.dart';
import 'package:test_pokemon/app/_childrens/home/data/models/pokemon_model.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/bloc/poke_detail/poke_detail_bloc.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/bloc/poke_list/poke_list_bloc.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/page/widgets/card_types.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/page/widgets/poke_detail.dart';
import 'package:test_pokemon/app/shared/utils/capitalize.dart';
import 'package:test_pokemon/app/shared/widgets/icon_svg.dart';
import 'package:test_pokemon/app/shared/widgets/scaffold_widget.dart';
import 'package:test_pokemon/app/ui/colors.dart';
import 'package:test_pokemon/app/ui/module_ui.dart';
import 'package:test_pokemon/app/ui/text.dart';
import 'package:test_pokemon/app/ui/typography.dart';

part 'widgets/search_widget.dart';
part 'widgets/list_poke.dart';
part 'widgets/card_poke.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokeListBloc>(
          create: (context) => Modular.get<PokeListBloc>()
            ..add(
              const PokeListStarted(limitPokemon: 1200),
            ),
        ),
      ],
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PockeText.h1(
            label: UiValues.pokemonTitle,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchPockeWidget(),
          const ListPoke(),
        ],
      ),
    );
  }
}
