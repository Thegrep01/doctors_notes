import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/models/client_model.dart';
import 'package:doctor_notes/screens/lists/note_list_screen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<Client> clients;
  final int status;

  ListScreen(this.clients, this.status);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          Theme(
            data: ThemeData(
              primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
            ),
            child: SliverAppBar(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: headers()),
              pinned: true,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 70.0,
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                color: (index % 2 == 0) ? Colors.white : Colors.grey[100],
                child: item(clients[index], context, status),
              );
            }, childCount: clients.length),
          ),
        ],
      ),
    );
  }
}

Widget item(Client client, BuildContext context, status) {
  return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NoteListScreen(
                  client.id, client.firstName + client.lastName, status)),
        );
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
      title: Row(
        children: <Widget>[
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    client.id.toString(),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ))),
          Expanded(
            child: Text(
              '${client.firstName} ${client.lastName}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              client.telnum,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ));
}
