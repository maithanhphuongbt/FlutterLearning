
import 'dart:convert';

import 'package:flutter_tutorial_chain/login/model/LoginRequest.dart';
import 'package:flutter_tutorial_chain/login/model/LoginResponse.dart';
import 'package:flutter_tutorial_chain/login/model/User.dart';
import 'package:http/http.dart' as http;

import 'APIConstants.dart';

class APIInterface {

  http.Client _client = http.Client();
  set client(http.Client value) => _client = value;


  Future<String> loginRequest (LoginRequest loginRequest) async {

    var body = json.encode(loginRequest);
    var response = await _client.post(loginUrl,
        headers: {"Content-Type": "application/json"},
        body: body);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
//      var loginResponse = LoginResponse.fromJson(data['meta']);
      return data['meta']['status'];
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<List<User>> getUsers() async {
    var response = await _client.get(getUsersUrl);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<dynamic> userData = data['results'];
      List<User> users = userData.map((f) => User.fromMap(f)).toList();

      return users;
    } else {
      throw Exception('Failed to get data');
    }
  }
}