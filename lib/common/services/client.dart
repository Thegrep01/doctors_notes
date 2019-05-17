import 'dart:async';
import 'dart:convert';

import 'package:doctor_notes/models/client_model.dart';
import 'package:http/http.dart' as http;

Future<List<Client>> getClients(int docId, int status) async {
  http.Response response = await http
      .get('http://localhost:3000/client/clients?docId=$docId&status=$status');
  if (response.statusCode == 200) {
    final res = json.decode(response.body);
    return res['data'].map<Client>((item) => Client.fromJson(item)).toList();
  } else {
    throw Exception('Failed to get clients');
  }
}

Future<Client> getClient(int id) async {
  http.Response response =
      await http.get('http://localhost:3000/client/clientInfo?id=$id');
  if (response.statusCode == 200) {
    final res = json.decode(response.body);
    var tmp = Client.fromJson(res['data']);
    print(tmp.problems);
    return Client.fromJson(res['data']);
  } else {
    throw Exception('Failed to get clients');
  }
}
