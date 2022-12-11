import 'package:test_pokemon/app/_childrens/home/domain/entities/type_entity.dart';

class TypeModel extends TypeEntity {
  TypeModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }
}
