import 'dart:async';
import 'dart:collection';

import 'package:doctor_notes/models/client_model.dart';
import 'package:rxdart/rxdart.dart';

class ActiveBloc {
  Stream<UnmodifiableListView<Client>> get clients => _clientsSubject.stream;

  final _clientsSubject = BehaviorSubject<UnmodifiableListView<Client>>();
  List<Client> _clients = [
    Client(firstName: 'Denis', lastName: 'Denis', status: 1, id: 39102),
    Client(firstName: 'Denis', lastName: 'Denis', status: 1, id: 18390),
    Client(firstName: 'Denis', lastName: 'Denis', status: 1, id: 78263),
    Client(firstName: 'Denis', lastName: 'Denis', status: 1, id: 20902),
    Client(firstName: 'Denis', lastName: 'Denis', status: 1, id: 32141),
    Client(firstName: 'Denis', lastName: 'Denis', status: 1, id: 12312),
  ];

  ActiveBloc() {
    _getClients();
  }

  _getClients() async {
    _clientsSubject.add(UnmodifiableListView(_clients));
  }
}
