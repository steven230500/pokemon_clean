// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonEntityAdapter extends TypeAdapter<PokemonEntity> {
  @override
  final int typeId = 0;

  @override
  PokemonEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      order: fields[2] as int,
      height: fields[3] as int,
      weight: fields[4] as int,
      types: (fields[5] as List).cast<TypeEntity>(),
      sprites: fields[6] as SpritesEntity,
      description: fields[7] as String,
      favorite: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.order)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.types)
      ..writeByte(6)
      ..write(obj.sprites)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
