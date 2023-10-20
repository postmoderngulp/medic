// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 2)
class person {
  @HiveField(0)
  String name;
  @HiveField(1)
  String surname;
  @HiveField(2)
  String patronymic;
  @HiveField(3)
  String birthday;
  @HiveField(4)
  int gender;
  person({
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.birthday,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'patronymic': patronymic,
      'birthday': birthday,
      'gender': gender,
    };
  }

  factory person.fromMap(Map<String, dynamic> map) {
    return person(
      name: map['name'] as String,
      surname: map['surname'] as String,
      patronymic: map['patronymic'] as String,
      birthday: map['birthday'] as String,
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory person.fromJson(String source) =>
      person.fromMap(json.decode(source) as Map<String, dynamic>);
}
