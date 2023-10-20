import 'dart:ui';

import 'package:hive/hive.dart';
part 'analyse.g.dart';

@HiveType(typeId: 0)
class analyse {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? preparation;
  @HiveField(3)
  String? biomaterial;
  @HiveField(4)
  String? resultDuring;
  @HiveField(5)
  String? days;
  @HiveField(6)
  int price = 0;

  analyse({
    required this.title,
    required this.description,
    required this.preparation,
    required this.biomaterial,
    required this.resultDuring,
    required this.days,
    required this.price,
  });

  factory analyse.fromJson(Map<String, dynamic> json) {
    return analyse(
        title: json["title"],
        description: json["description"],
        preparation: json["processDescription"],
        biomaterial: json["material"],
        resultDuring: json["deadline"],
        days: json["currency"],
        price: json["price"]);
  }

  @override
  // ignore: deprecated_member_use
  int get hashCode => hashValues(
      title, description, preparation, biomaterial, resultDuring, days, price);

  @override
  bool operator ==(Object other) {
    return other is analyse &&
        title == other.title &&
        description == other.description &&
        preparation == other.preparation &&
        biomaterial == other.biomaterial &&
        resultDuring == other.resultDuring &&
        days == other.days &&
        price == other.price;
  }
}
