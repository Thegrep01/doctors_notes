import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/models/client_model.dart';
import 'package:doctor_notes/screens/lists/list_screen.dart';
import 'package:doctor_notes/store/actions/client_actions.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:doctor_notes/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel {
  final List<Client> clients;

  _ViewModel({this.clients});
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex;

  @override
  void initState() {
    store.dispatch(GetClientPending(docId: 1, status: 0));
    _currentIndex = 0;
    super.initState();
  }

  void _handleTap(int index) {
    setState(() {
      _currentIndex = index;
      store.dispatch(GetClientPending(docId: 1, status: index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel(
              clients: store.state.clients,
            ),
        builder: (context, state) {
          return Scaffold(
              appBar: header(title: 'Doctor Notes'),
              body: ListScreen(state.clients),
              bottomNavigationBar: BottomNavigationBar(
                onTap: _handleTap,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore),
                    title: Text('Active'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text('Patients'),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive), title: Text('Archive'))
                ],
              ));
        });
  }
}
