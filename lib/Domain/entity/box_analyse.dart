import 'package:hive/hive.dart';
import 'package:medic/Domain/entity/analyse.dart';
part 'box_analyse.g.dart';

@HiveType(typeId: 1)
class boxAnalyse {
  @HiveField(0)
  List<dynamic> listAnalyse;

  boxAnalyse({required this.listAnalyse});

  factory boxAnalyse.fromJson(List<dynamic> jsonList) {
    return boxAnalyse(
        listAnalyse: (jsonList)
            .map((e) => analyse.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
