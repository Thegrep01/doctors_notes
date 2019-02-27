import 'dart:collection';

import 'package:doctor_notes/blocs/active_bloc.dart';
import 'package:doctor_notes/models/client_model.dart';
import 'package:flutter/material.dart';

class ActiveList extends StatelessWidget {
  final ActiveBloc bloc = ActiveBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UnmodifiableListView<Client>>(
      stream: bloc.clients,
      initialData: UnmodifiableListView<Client>([]),
      builder: (context, snapshot) => ListView(
            children: snapshot.data.map(_item).toList(),
          ),
    );
  }

  Widget _item(Client client) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
      title: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            client.id.toString(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                client.firstName,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                client.lastName,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
