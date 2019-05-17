import 'package:doctor_notes/screens/login.dart';
import 'package:doctor_notes/screens/main_screen.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:doctor_notes/store/store.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() async {
  final prefs = await SharedPreferences.getInstance();

  runApp(MyApp(localStore: prefs, store: store));
}

class MyApp extends StatelessWidget {
  final SharedPreferences localStore;
  final Store<AppState> store;

  MyApp({this.store, this.localStore});

  @override
  Widget build(BuildContext context) {
    final String token = localStore.getString('token') ?? null;

    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: token != null ? MainScreen() : LoginScreen(),
        ));
  }
}
