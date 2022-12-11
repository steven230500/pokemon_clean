part of '../home_page.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokeDetailBloc, PokeDetailState>(
      builder: (context, state) {
        if (state is PokeDetailLoading || state is PokeDetailInitial) {
          return const SizedBox(
            width: 5,
            height: 5,
            child: CircularProgressIndicator(),
          );
        }
        if (state is PokeDetailLoad) {
          return InkWell(
            onTap: () {
              Modular.to.pushNamed('/detail', arguments: state.pokemon);
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<PokeDetailBloc>(context).add(
                          PokeDetailSelectedFavorite(
                            pokemon: state.pokemon as PokemonModel,
                          ),
                        );
                        Modular.get<FavoritesBloc>()
                            .add(const FavoritesStarted());
                      },
                      child: state.pokemon.favorite
                          ? const SvgIcon(
                              UiValues.heartFilledSvg,
                              color: PockeColors.btnColor,
                            )
                          : const SvgIcon(
                              UiValues.heartSvg,
                            ),
                    ),
                  ),
                  Image.network(
                    state.pokemon.sprites.frontDefault,
                    scale: 0.8,
                  ),
                  PockeText.small(
                    label: state.pokemon.order.toString(),
                  ),
                  PockeText.body(
                    label: capitalize(state.pokemon.name),
                    fontWeight: FontWeight.bold,
                  ),
                  CardTypes(pokemon: state.pokemon as PokemonModel),
                ],
              ),
            ),
          );
        }
        return Center(
          child: PockeText.h1(
            label: 'Not Found',
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
