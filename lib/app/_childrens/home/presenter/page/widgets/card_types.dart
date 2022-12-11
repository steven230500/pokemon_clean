import 'package:flutter/material.dart';
import 'package:test_pokemon/app/_childrens/home/data/models/pokemon_model.dart';
import 'package:test_pokemon/app/shared/utils/capitalize.dart';
import 'package:test_pokemon/app/ui/colors.dart';
import 'package:test_pokemon/app/ui/text.dart';

class CardTypes extends StatelessWidget {
  final PokemonModel pokemon;
  final MainAxisAlignment mainAxisAlignment;
  const CardTypes({
    super.key,
    required this.pokemon,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: pokemon.types
          .map(
            (e) => Container(
              margin: const EdgeInsets.only(right: 10.0, top: 5.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: PockeColors.backgroundTypePokemon,
              ),
              child: PockeText.labelText(
                label: capitalize(e.name),
              ),
            ),
          )
          .toList(),
    );
  }
}
