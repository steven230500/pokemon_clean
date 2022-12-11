import 'package:test_pokemon/app/_childrens/home/domain/entities/sprites_entity.dart';
import 'package:test_pokemon/app/_childrens/home/domain/entities/type_entity.dart';
import 'package:hive/hive.dart';

part 'pokemon_entity.g.dart';

@HiveType(typeId: 0)
class PokemonEntity {
  const PokemonEntity({
    required this.id,
    required this.name,
    required this.order,
    required this.height,
    required this.weight,
    required this.types,
    required this.sprites,
    required this.description,
    required this.favorite,
  });
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int order;
  @HiveField(3)
  final int height;
  @HiveField(4)
  final int weight;
  @HiveField(5)
  final List<TypeEntity> types;
  @HiveField(6)
  final SpritesEntity sprites;
  @HiveField(7)
  final String description;
  @HiveField(8)
  final bool favorite;
}
