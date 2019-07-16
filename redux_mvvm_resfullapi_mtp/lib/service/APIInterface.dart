
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redux_mvvm_resfullapi_mtp/models/login_request.dart';

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
      return data['meta']['status'];
    } else {
      throw Exception('Failed to get data');
    }
  }
}