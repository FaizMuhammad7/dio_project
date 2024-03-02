// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example2_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Example2ModelAdapter extends TypeAdapter<Example2Model> {
  @override
  final int typeId = 0;

  @override
  Example2Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Example2Model(
      title: fields[0] as String,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Example2Model obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Example2ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
