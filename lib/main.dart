import 'package:doctor_notes/screens/clientLogin_srceen.dart';
import 'package:doctor_notes/screens/login.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:doctor_notes/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          home: Intro(),
        ));
  }
}

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctorButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        padding: EdgeInsets.all(12),
        color: Color.fromRGBO(20, 137, 124, 1),
        child: Text('Log In as Doctor', style: TextStyle(color: Colors.white)),
      ),
    );

    final clientButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClientLoginScreen()),
          );
        },
        padding: EdgeInsets.all(12),
        color: Color.fromRGBO(20, 137, 124, 1),
        child: Text('Log In as Client', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            doctorButton,
            SizedBox(height: 8.0),
            clientButton,
          ],
        ),
      ),
    );
  }
}
