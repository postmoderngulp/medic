import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:medic/Domain/Hive/hive.dart';

import '../entity/clientAddress.dart';

class addressBannerModel extends ChangeNotifier {
  bool addressValide = false;
  bool longitudeValide = false;
  bool widthValide = false;
  bool heightValide = false;
  bool flatValide = false;
  bool entranceValide = false;
  bool floorValide = false;
  bool intercomValide = false;
  bool saveVal = false;


  String address = "";
  int longitude =  0;
  int width =  0;
  int height =  0;
  int flat =  0;
  int entrance =  0;
  int floor =  0;
  String intercom =  "";


  addressBannerModel(){
    _setup();
  }

  void _setup() async{
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(clientAddressAdapter());
    }
    final box = await Hive.openBox<clientAddress>(namesBox.adressDataBox);
    if(box.get('key') != null) {
      final itemAddress = box.get('key');
      address = itemAddress!.address;
      longitude = itemAddress!.longitude;
      width = itemAddress!.width;
      height = itemAddress!.height;
      flat = itemAddress!.flat;
      entrance = itemAddress!.entrance;
      floor = itemAddress!.floor;
      intercom = itemAddress!.intercom;
    }
    notifyListeners();
  }

  void setAdresValide() {
    address.isNotEmpty ? addressValide = true : addressValide = false;
    notifyListeners();
  }

  void setLongitudeValide() {
   longitude != 0 ? longitudeValide = true : longitudeValide = false;
    notifyListeners();
  }

  setSaveValide(bool val){
    saveVal = val;
    notifyListeners();
  }

  void setWidthValide() {
    width != 0 ? widthValide = true : widthValide = false;
    notifyListeners();
  }

  void setHeightValide() {
    height != 0 ? heightValide = true : heightValide = false;
    notifyListeners();
  }

  void setFlatValide() {
    flat != 0 ? flatValide = true : flatValide = false;
    notifyListeners();
  }

  void setEntranceValide() {
    entrance != 0 ? entranceValide = true : entranceValide = false;
    notifyListeners();
  }

  void setFloorValide() {
    floor != 0 ? floorValide = true : floorValide = false;
    notifyListeners();
  }

  void setIntercomValide() {
    intercom != 0 ? intercomValide = true : intercomValide = false;
    notifyListeners();
  }

  Future<void> saveAddress(String Address,int longitude,int width,int height,int flat,int entrance,int floor,String intercom) async {
    final box = await Hive.openBox<clientAddress>(namesBox.adressDataBox);
    if (box.get('key') != null) {
      await box.clear();
    }
    clientAddress address = clientAddress(address: Address, longitude: longitude, width: width, height: height, flat: flat, entrance: entrance, floor: floor, intercom: intercom, buildingType: 0);
    await box.put('key', address);
  }

  Future<void> clearAddress() async {
    final box = await Hive.openBox<clientAddress>(namesBox.adressDataBox);
    await box.clear();
  }
}
