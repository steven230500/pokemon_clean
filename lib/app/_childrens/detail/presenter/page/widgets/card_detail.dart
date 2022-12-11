part of '../detail_page.dart';

class CardDetailPokemon extends StatelessWidget {
  final PokemonModel pokemon;
  const CardDetailPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: PockeText.h1(
              label: capitalize(pokemon.name),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          CardTypes(
            pokemon: pokemon,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 10.0),
          PockeText.body(
            label: pokemon.description,
          ),
          const SizedBox(height: 10.0),
          TextRich(
            identifier: 'ID: ',
            value: pokemon.id.toString(),
          ),
          const SizedBox(height: 10.0),
          TextRich(
            identifier: 'Altura: ',
            value: pokemon.height.toString(),
          ),
          const SizedBox(height: 10.0),
          TextRich(
            identifier: 'Peso: ',
            value: pokemon.weight.toString(),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: PockeColors.btnColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: PockeText.body(
                    label: 'Agregar a favoritos'.toUpperCase(),
                    color: PockeColors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextRich extends StatelessWidget {
  final String identifier;
  final String value;
  const TextRich({
    super.key,
    required this.identifier,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: identifier,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: PockeColors.black,
                fontSize: PocketTypography.body,
                fontFamily: PocketTypography.segoe),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
                color: PockeColors.black,
                fontSize: PocketTypography.body,
                fontFamily: PocketTypography.segoe),
          ),
        ],
      ),
    );
  }
}
