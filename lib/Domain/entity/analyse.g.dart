// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyse.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class analyseAdapter extends TypeAdapter<analyse> {
  @override
  final int typeId = 0;

  @override
  analyse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return analyse(
      title: fields[0] as String?,
      description: fields[1] as String?,
      preparation: fields[2] as String?,
      biomaterial: fields[3] as String?,
      resultDuring: fields[4] as String?,
      days: fields[5] as String?,
      price: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, analyse obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.preparation)
      ..writeByte(3)
      ..write(obj.biomaterial)
      ..writeByte(4)
      ..write(obj.resultDuring)
      ..writeByte(5)
      ..write(obj.days)
      ..writeByte(6)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is analyseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
