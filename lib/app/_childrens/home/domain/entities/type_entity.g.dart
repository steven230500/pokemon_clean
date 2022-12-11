// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeEntityAdapter extends TypeAdapter<TypeEntity> {
  @override
  final int typeId = 2;

  @override
  TypeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypeEntity(
      name: fields[0] as String,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TypeEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
