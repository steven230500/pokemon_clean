import 'package:test_pokemon/app/_childrens/home/data/models/sprites_model.dart';
import 'package:test_pokemon/app/_childrens/home/data/models/type_model.dart';
import 'package:test_pokemon/app/_childrens/home/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required int id,
    required String name,
    required int order,
    required int height,
    required int weight,
    required List<TypeModel> types,
    required SpritesModel sprites,
    required String description,
    required bool favorite,
  }) : super(
          id: id,
          name: name,
          order: order,
          height: height,
          weight: weight,
          types: types,
          sprites: sprites,
          description: description,
          favorite: favorite,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'order': order,
      'height': height,
      'weight': weight,
      'types': (types as List<TypeModel>).map((e) => e.toMap()).toList(),
      'sprites': (sprites as SpritesModel).toMap(),
      'description': description,
    };
  }

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      order: json['order'] ?? 0,
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      types: (json['types'] as List<dynamic>)
          .map((e) => TypeModel.fromJson(e['type'] as Map<String, dynamic>))
          .toList(),
      sprites: SpritesModel.fromJson(json['sprites'] ?? {}),
      description: json['flavor_text'] ?? '',
      favorite: false,
    );
  }

  PokemonModel copyWith({
    int? id,
    String? name,
    int? order,
    int? height,
    int? weight,
    List<TypeModel>? types,
    SpritesModel? spirites,
    String? description,
    bool? favorite,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      types: types ?? (this.types as List<TypeModel>),
      sprites: spirites ?? (sprites as SpritesModel),
      description: description ?? this.description,
      favorite: favorite ?? this.favorite,
    );
  }
}
