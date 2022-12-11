import 'package:hive/hive.dart';

part 'sprites_entity.g.dart';

@HiveType(typeId: 1)
class SpritesEntity {
  const SpritesEntity({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.frontDefault,
    required this.frontFemale,
  });
  @HiveField(0)
  final String backDefault;
  @HiveField(1)
  final String backFemale;
  @HiveField(2)
  final String backShiny;
  @HiveField(3)
  final String frontDefault;
  @HiveField(4)
  final String frontFemale;
}
