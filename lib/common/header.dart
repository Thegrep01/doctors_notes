import 'package:flutter/material.dart';

AppBar header({title}) {
  return AppBar(
    title: Text(title),
  );
}

List<Widget> headers() {
  return [
    Text("Client Id", style: TextStyle(fontSize: 14.0, color: Colors.white)),
    Text("Name", style: TextStyle(fontSize: 14.0, color: Colors.white)),
    Text("Tel Num", style: TextStyle(fontSize: 14.0, color: Colors.white))
  ];
}
