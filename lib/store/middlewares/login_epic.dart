import 'dart:async';
import 'package:doctor_notes/common/services/login.dart';
import 'package:doctor_notes/screens/main_screen.dart';
import 'package:doctor_notes/store/actions/login_actions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> loginEpic(Stream<dynamic> actions, EpicStore<dynamic> store) {
  return actions
      .where((action) => action is LoginPending)
      .asyncMap((action) => login(action.payload).then((item) {
            Navigator.pushReplacement(
              action.context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
            return LoginSuccess();
          }).catchError((error) {
            print(error);
            return null;
          }));
}

class ListScreen {
}
