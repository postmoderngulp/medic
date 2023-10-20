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

  clientAddress(
      {required this.address,
      required this.longitude,
      required this.width,
      required this.height,
      required this.flat,
      required this.entrance,
      required this.floor,
      required this.intercom,
      required this.buildingType});

  Map<String, dynamic> toJson() => {
        'addres': address,
        'longitude': longitude,
        'width': width,
        'height': height,
        'flat': flat,
        'entrance': entrance,
        'floor': floor,
        'intercom': intercom,
        'buildingType': buildingType
      };
}
