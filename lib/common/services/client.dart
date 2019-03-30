import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:doctor_notes/models/client_model.dart';

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
