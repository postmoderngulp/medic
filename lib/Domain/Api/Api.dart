import 'dart:convert';
import 'package:medic/Domain/entity/clientAddress.dart';
import 'package:medic/Domain/entity/news.dart';
import 'package:http/http.dart' as http;
import 'package:medic/Domain/entity/box_analyse.dart';
import 'package:medic/Domain/entity/person.dart';

import '../entity/token.dart';

class Api {
  Future sendEmail(String email) async {
    Map<String, String> body = {"email": email};
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(body);
    var endPoint = Uri.parse('http://192.168.144.66:8080/api/signin');
    final encoding = Encoding.getByName('utf-8');
    final response = await http.post(
      endPoint,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );
    print(response.statusCode);
  }

  Future sendRecoveryCode(String email, String recoveryCode) async {
    Map<String, String> body = {"email": email, "recoveryCode": recoveryCode};
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(body);
    var endPoint = Uri.parse('http://192.168.144.66:8080/api/confirm');
    final encoding = Encoding.getByName('utf-8');
    final response = await http.post(
      endPoint,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );
    final el = Token.fromJson(jsonDecode(response.body));
    print(response.statusCode);
    print(response.body);
    return el.token;
  }

  Future<String> createCardUser(String name, String surname, String patronymic,
      String dob, int gender, String token) async {
    Map<String, String> body = {
      "firstName": name,
      "lastName": surname,
      "patronymic": patronymic,
      "dob": dob,
      "gender": gender.toString(),
    };
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    String jsonBody = json.encode(body);
    var endPoint = Uri.parse('http://192.168.144.66:8080/api/profile');
    final encoding = Encoding.getByName('utf-8');
    final response = await http.post(
      endPoint,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );
    return response.body;
  }

  Future getAnalyse() async {
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('http://192.168.144.66:8080/api/catalog');
    final response = await http.get(
      endPoint,
      headers: headers,
    );
    var body = jsonDecode(response.body);
    print(response.statusCode);
    print(response.body);
    return boxAnalyse.fromJson(body);
  }

  Future<person> getProfile(String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    var endPoint = Uri.parse('http://192.168.144.66:8080/api/profile');
    final response = await http.get(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
    return person.fromJson(response.body);
  }

  Future putProfile(String name, String surname, String patronymic, String dob,
      int gender, String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    var endPoint = Uri.parse('http://192.168.144.66:8080/api/profile');
    final response = await http.put(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
  }

  Future getNews() async {
    final headers = {
      'Content-Type': 'application/json',
    };
    var endPoint = Uri.parse('http://192.168.144.66:8080/api/news');
    final response = await http.get(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
    return news.fromJson(jsonDecode(response.body));
  }

  Future createOrder(clientAddress adress, String date, List<person> userList,
      String phone, int price, String comment, String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    Map<String, dynamic> body = {
      "clientAddress": adress.toJson(),
      "date": date,
      "patientsTakingTests": userList.map((person) => person.toJson()).toList(),
      "phone": phone,
      "price": price,
      "comment": comment,
    };
    var endPoint = Uri.parse('http://192.168.144.66:8080/api/order');
    final jsonBody = json.encode(body);
    final response =
        await http.post(endPoint, headers: headers, body: jsonBody);
    print(response.statusCode);
    print(response.body);
  }
}
