import 'package:hive/hive.dart';

part 'type_entity.g.dart';

@HiveType(typeId: 2)
class TypeEntity {
  const TypeEntity({
    required this.name,
    required this.url,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;
}
