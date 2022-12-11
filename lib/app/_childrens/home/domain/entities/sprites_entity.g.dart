// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprites_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpritesEntityAdapter extends TypeAdapter<SpritesEntity> {
  @override
  final int typeId = 1;

  @override
  SpritesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpritesEntity(
      backDefault: fields[0] as String,
      backFemale: fields[1] as String,
      backShiny: fields[2] as String,
      frontDefault: fields[3] as String,
      frontFemale: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SpritesEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.backDefault)
      ..writeByte(1)
      ..write(obj.backFemale)
      ..writeByte(2)
      ..write(obj.backShiny)
      ..writeByte(3)
      ..write(obj.frontDefault)
      ..writeByte(4)
      ..write(obj.frontFemale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpritesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
