import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:medic/Domain/Api/Api.dart';
import 'package:medic/Domain/Hive/hive.dart';
import 'package:medic/Domain/entity/analyse.dart';
import 'package:medic/Domain/entity/box_analyse.dart';
import 'package:medic/Domain/entity/clientAddress.dart';
import 'package:medic/Domain/flutterSecureStorage/flutterSecureStore.dart';
import '../../Navigation/NavigatorClass.dart';
import '../entity/person.dart';

class patienceOrderModel extends ChangeNotifier {
  List<person> personList = [];
  List<analyse> analyseList = [];
  bool saveVal = false;
  final dropValue = ValueNotifier('');
  int index = -1;
  bool addressValide = false;
  bool longitudeValide = false;
  bool widthValide = false;
  bool heightValide = false;
  bool flatValide = false;
  bool entranceValide = false;
  bool floorValide = false;
  bool intercomValide = false;
  bool dayValide = false;
  bool timeValide = false;
  bool personValide = false;
  bool phoneValide = false;
  bool priceValide = true;
  bool commentValide = false;

  clientAddress adress = clientAddress(
      address: '',
      longitude: 0,
      width: 0,
      height: 0,
      flat: 0,
      entrance: 0,
      floor: 0,
      intercom: '',
      buildingType: 0);
  DateTime dob = DateTime.now();
  String phone = '';
  int price = 0;
  String comment = '';

  patienceOrderModel() {
    _setup();
  }

  void setIndex(int Index) {
    index = Index;
    notifyListeners();
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(personAdapter());
    }
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(analyseAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(boxAnalyseAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(clientAddressAdapter());
    }
    final boxAddress =
        await Hive.openBox<clientAddress>(namesBox.adressDataBox);
    final boxAnalyse = await Hive.openBox<analyse>(namesBox.LIstAnalyseDataBox);
    final box = await Hive.openBox<person>(namesBox.listPersonDataBox);
    if (boxAddress.get('key') != null) {
      adress = boxAddress.get('key')!;
    }
    personList = box.values.toList();
    analyseList = boxAnalyse.values.toList();
    setPersonValide();
    notifyListeners();
  }



  void setAdresValide() {
    adress.address.isNotEmpty ? addressValide = true : addressValide = false;
    notifyListeners();
  }

  void setLongitudeValide() {
    adress.longitude != 0 ? longitudeValide = true : longitudeValide = false;
    notifyListeners();
  }

  void setWidthValide() {
    adress.width != 0 ? widthValide = true : widthValide = false;
    notifyListeners();
  }

  void setHeightValide() {
    adress.height != 0 ? heightValide = true : heightValide = false;
    notifyListeners();
  }

  void setFlatValide() {
    adress.flat != 0 ? flatValide = true : flatValide = false;
    notifyListeners();
  }

  void setEntranceValide() {
    adress.entrance != 0 ? entranceValide = true : entranceValide = false;
    notifyListeners();
  }

  void setFloorValide() {
    adress.floor != 0 ? floorValide = true : floorValide = false;
    notifyListeners();
  }

  void setIntercomValide() {
    adress.intercom != 0 ? intercomValide = true : intercomValide = false;
    notifyListeners();
  }

  void setDayValide() {
    dob.day != 0 ? dayValide = true : dayValide = false;
    notifyListeners();
  }

  void setTimeValide() {
    dob.hour != 0 ? timeValide = true : timeValide = false;
    notifyListeners();
  }

  void setPersonValide() {
    personList.isNotEmpty ? personValide = true : personValide = false;
    notifyListeners();
  }

  void setPhoneValide() {
    phone != 0 ? phoneValide = true : phoneValide = false;
    notifyListeners();
  }

  void setPriceValide() {
    price >= 0 ? priceValide = true : priceValide = false;
    notifyListeners();
  }

  void setCommentValide() {
    comment.isNotEmpty ? commentValide = true : commentValide = false;
    notifyListeners();
  }

  void getAddress() async{
    _setup();
    notifyListeners();
  }

  void createOffer(BuildContext context, clientAddress adress, String dob,
      List<person> userList, String phone, int price, String comment) async {
    final api = Api();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: FluttSecureStorage.key);
    await api.createOrder(adress, dob, userList, phone, price, comment, token!);
    goToPaymentWidget(context);
  }

  void addUser(person el) async {
    final box = await Hive.openBox<person>(namesBox.listPersonDataBox);
    await box.add(el);
    _setup();
  }

  void delUser(int index) async {
    final box = await Hive.openBox<person>(namesBox.listPersonDataBox);
    await box.deleteAt(index);
    _setup();
  }

  void goToPaymentWidget(BuildContext context) {
    Navigator.of(context).pushNamed(NavigatorPaths.paymentPath);
  }
}
