// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class personAdapter extends TypeAdapter<person> {
  @override
  final int typeId = 2;

  @override
  person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return person(
      name: fields[0] as String,
      surname: fields[1] as String,
      patronymic: fields[2] as String,
      birthday: fields[3] as String,
      gender: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, person obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.surname)
      ..writeByte(2)
      ..write(obj.patronymic)
      ..writeByte(3)
      ..write(obj.birthday)
      ..writeByte(4)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is personAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
