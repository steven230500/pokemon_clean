part of '../home_page.dart';

class SearchPockeWidget extends StatelessWidget {
  const SearchPockeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            style: const TextStyle(fontSize: PocketTypography.body),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: 'Busca un pokemon',
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (String? value) {
              Modular.get<PokeListBloc>().pokeWord = value;
            },
          ),
        ),
        const SizedBox(width: 15),
        TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 20.0,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(PockeColors.btnColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          onPressed: () {
            final pokeWorkd = Modular.get<PokeListBloc>().pokeWord;
            if (pokeWorkd == '') {
              Modular.get<PokeListBloc>().add(
                const PokeListStarted(limitPokemon: 1200),
              );
            } else {
              Modular.get<PokeListBloc>().add(
                PokeListSearched(
                  pokemonName: Modular.get<PokeListBloc>().pokeWord ?? '',
                ),
              );
            }
          },
          child: PockeText.body(
            label: 'BUSCAR',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
