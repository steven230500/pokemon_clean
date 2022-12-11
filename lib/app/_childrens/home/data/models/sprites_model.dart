import 'package:test_pokemon/app/_childrens/home/domain/entities/sprites_entity.dart';

class SpritesModel extends SpritesEntity {
  SpritesModel({
    required String backDefault,
    required String backFemale,
    required String backShiny,
    required String frontDefault,
    required String frontFemale,
  }) : super(
          backDefault: backDefault,
          backFemale: backFemale,
          backShiny: backShiny,
          frontDefault: frontDefault,
          frontFemale: frontFemale,
        );

  factory SpritesModel.fromJson(Map<String, dynamic> json) {
    return SpritesModel(
        backDefault: json['back_default'] ?? '',
        backFemale: json['back_female'] ?? '',
        backShiny: json['back_shiny'] ?? '',
        frontDefault: json['front_default'] ?? '',
        frontFemale: json['front_female'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'backDefault': backDefault,
      'backFemale': backFemale,
      'backShiny': backShiny,
      'frontDefault': frontDefault,
      'frontFemale': frontFemale,
    };
  }
}
