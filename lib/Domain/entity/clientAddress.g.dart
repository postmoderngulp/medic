// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clientAddress.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class clientAddressAdapter extends TypeAdapter<clientAddress> {
  @override
  final int typeId = 3;

  @override
  clientAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return clientAddress(
      address: fields[0] as String,
      longitude: fields[1] as int,
      width: fields[2] as int,
      height: fields[3] as int,
      flat: fields[4] as int,
      entrance: fields[5] as int,
      floor: fields[6] as int,
      intercom: fields[7] as String,
      buildingType: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, clientAddress obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.width)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.flat)
      ..writeByte(5)
      ..write(obj.entrance)
      ..writeByte(6)
      ..write(obj.floor)
      ..writeByte(7)
      ..write(obj.intercom)
      ..writeByte(8)
      ..write(obj.buildingType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is clientAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
