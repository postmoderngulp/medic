// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_analyse.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class boxAnalyseAdapter extends TypeAdapter<boxAnalyse> {
  @override
  final int typeId = 1;

  @override
  boxAnalyse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return boxAnalyse(
      listAnalyse: (fields[0] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, boxAnalyse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.listAnalyse);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is boxAnalyseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
