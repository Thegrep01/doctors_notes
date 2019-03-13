import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> login(Map<String, String> credentials) async {
  var body = jsonEncode(
      {"login": credentials['login'], "password": credentials['password']});
  http.Response response = await http.post('http://localhost:3000/doctor/login',
      body: body, headers: {"content-type": "application/json"});
  if (response.statusCode == 200) {
    final res = json.decode(response.body);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', res['data']);
  } else {
    throw Exception('Failed to login');
  }
}
