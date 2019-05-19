import 'dart:async';
import 'dart:convert';

import 'package:doctor_notes/models/client_model.dart';
import 'package:http/http.dart' as http;

Future<List<Client>> getClients(int docId, int status) async {
  http.Response response = await http
      .get('http://localhost:3000/client/clients?docId=$docId&status=$status');
  if (response.statusCode == 200) {
    final res = json.decode(response.body);
    return res['data']
        .map<Client>((item) => Client.fromJson(item, null))
        .toList();
  } else {
    throw Exception('Failed to get clients');
  }
}

Future<Client> getClient(int id) async {
  http.Response response =
      await http.get('http://localhost:3000/client/clientInfo?id=$id');
  if (response.statusCode == 200) {
    final res = json.decode(response.body);
    List<Diagnosis> tmp = res['data']['problems']
        .map<Diagnosis>((i) => Diagnosis.fromJson(i))
        .toList();
    Client client = Client.fromJson(res['data'], tmp);
    return client;
  } else {
    throw Exception('Failed to get clients');
  }
}

Future<Client> updateClient(int id, Client client) async {
  print(json.encode({'data': json.encode(client.toJson())}));
  http.Response response = await http.put(
      'http://localhost:3000/client/updateClient?id=$id&weight=${client.weigth}&pressure=${client.pressure}&status=${client.status}',
      body: json.encode(client.toJson()));

  if (response.statusCode == 200) {
    final res = json.decode(response.body);
    List<Diagnosis> tmp = res['data']['problems']
        .map<Diagnosis>((i) => Diagnosis.fromJson(i))
        .toList();
    Client client = Client.fromJson(res['data'], tmp);
    return client;
  } else {
    throw Exception('Failed to get clients');
  }
}
