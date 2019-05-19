import 'package:flutter/material.dart';

AppBar header({title, actions}) {
  return AppBar(
    title: Text(title ?? ''),
    actions: actions ?? [],
    centerTitle: true,
  );
}

List<Widget> headers() {
  return [
    Text("Client Id", style: TextStyle(fontSize: 14.0, color: Colors.white)),
    Text("Name", style: TextStyle(fontSize: 14.0, color: Colors.white)),
    Text("Tel Num", style: TextStyle(fontSize: 14.0, color: Colors.white))
  ];
}

List<Widget> notesListHeaders() {
  return [
    Text("Note Id", style: TextStyle(fontSize: 14.0, color: Colors.white)),
    Text("Title", style: TextStyle(fontSize: 14.0, color: Colors.white)),
    Text("Date", style: TextStyle(fontSize: 14.0, color: Colors.white))
  ];
}
