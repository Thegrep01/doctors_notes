import 'dart:convert';

import 'package:doctor_notes/models/note_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

Future<List<Note>> getNotes(int id) async {
  http.Response response =
      await http.get('http://localhost:3000/client/notes?id=$id');
  if (response.statusCode == 200) {
    final res = json.decode(response.body);
    return res['data'].map<Note>((item) => Note.fromJson(item)).toList();
  } else {
    throw Exception('Failed to get notes');
  }
}

Future<Note> getNote(int id) async {
  http.Response response =
      await http.get('http://localhost:3000/client/getNote?id=$id');
  if (response.statusCode == 200) {
    final res = json.decode(response.body);
    return Note.fromJson(res['data']);
  } else {
    throw Exception('Failed to get notes');
  }
}

Future<Null> createNote(Note note, BuildContext context, String diagnos) async {
  http.Response response = await http.post('http://localhost:3000/client/note',
      body: json.encode(
        {"note": note.toJson(), "diagnos": diagnos},
      ),
      headers: {'Content-type': 'application/json'});

  if (response.statusCode == 200) {
    Navigator.of(context).pop();
    return;
  } else {
    throw Exception('Failed to create note');
  }
}
