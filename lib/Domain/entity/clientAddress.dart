// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'clientAddress.g.dart';

@HiveType(typeId: 3)
class clientAddress {
  @HiveField(0)
  String address;
  @HiveField(1)
  int longitude;
  @HiveField(2)
  int width;
  @HiveField(3)
  int height;
  @HiveField(4)
  int flat;
  @HiveField(5)
  int entrance;
  @HiveField(6)
  int floor;
  @HiveField(7)
  String intercom;
  @HiveField(8)
  int buildingType;
  clientAddress({
    required this.address,
    required this.longitude,
    required this.width,
    required this.height,
    required this.flat,
    required this.entrance,
    required this.floor,
    required this.intercom,
    required this.buildingType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'longitude': longitude,
      'width': width,
      'height': height,
      'flat': flat,
      'entrance': entrance,
      'floor': floor,
      'intercom': intercom,
      'buildingType': buildingType,
    };
  }

  factory clientAddress.fromMap(Map<String, dynamic> map) {
    return clientAddress(
      address: map['address'] as String,
      longitude: map['longitude'] as int,
      width: map['width'] as int,
      height: map['height'] as int,
      flat: map['flat'] as int,
      entrance: map['entrance'] as int,
      floor: map['floor'] as int,
      intercom: map['intercom'] as String,
      buildingType: map['buildingType'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory clientAddress.fromJson(String source) =>
      clientAddress.fromMap(json.decode(source) as Map<String, dynamic>);
}
