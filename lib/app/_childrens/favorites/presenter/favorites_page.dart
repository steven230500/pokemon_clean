import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_pokemon/app/_childrens/favorites/presenter/bloc/favorites_bloc.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/bloc/poke_detail/poke_detail_bloc.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/bloc/poke_list/poke_list_bloc.dart';
import 'package:test_pokemon/app/_childrens/home/presenter/page/widgets/poke_detail.dart';
import 'package:test_pokemon/app/shared/widgets/scaffold_widget.dart';
import 'package:test_pokemon/app/ui/module_ui.dart';
import 'package:test_pokemon/app/ui/text.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _View();
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Modular.to.pop();
                  Modular.get<PokeListBloc>()
                      .add(const PokeListStarted(limitPokemon: 1200));
                },
                icon: const Icon(Icons.arrow_back),
              ),
              PockeText.h1(
                label: UiValues.pokemonFavorite,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesInitial) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is FavoritesLoad) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.66,
                      crossAxisSpacing: 15.0,
                    ),
                    itemCount: state.pokemon.length,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    itemBuilder: (BuildContext context, int index) {
                      return BlocProvider.value(
                        value: Modular.get<PokeDetailBloc>(),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: PokeDetail(
                            name: state.pokemon[index].name,
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: PockeText.h1(
                    label: 'Not Found',
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
