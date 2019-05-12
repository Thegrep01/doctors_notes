import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/models/note_model.dart';
import 'package:doctor_notes/screens/clientDetails_screen.dart';
import 'package:doctor_notes/screens/create_screen.dart';
import 'package:doctor_notes/store/actions/client_actions.dart';
import 'package:doctor_notes/store/actions/notes_action.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:doctor_notes/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel {
  final List<Note> notes;
  final Function getClientInfo;

  _ViewModel({this.notes, this.getClientInfo});
}

class NoteListScreen extends StatefulWidget {
  final int clientId;
  final String clientName;

  NoteListScreen(this.clientId, this.clientName);

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  void initState() {
    store.dispatch(GetNotesPending(widget.clientId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel(
            notes: store.state.notes,
            getClientInfo: (int id) => store.dispatch(GetClientPending(id))),
        builder: (context, state) {
          return Scaffold(
              appBar: header(title: 'Doctor Notes', actions: [
                IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {
                      state.getClientInfo(widget.clientId);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientDetails()));
                    })
              ]),
              body: Container(
                  child: CustomScrollView(slivers: <Widget>[
                Theme(
                    data: ThemeData(
                        primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
                    child: SliverAppBar(
                        automaticallyImplyLeading: false,
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: notesListHeaders()),
                        pinned: true)),
                SliverFixedExtentList(
                    itemExtent: 70.0,
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Container(
                          color: (index % 2 == 0)
                              ? Colors.white
                              : Colors.grey[100],
                          child: item(state.notes[index]));
                    }, childCount: state.notes.length))
              ])),
              floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateScreen(
                                widget.clientId, widget.clientName)));
                  }));
        });
  }
}

Widget item(Note note) {
  return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
      title: Row(
        children: <Widget>[
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    note.id.toString(),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ))),
          Expanded(
            child: Text(
              note.title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              note.date,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ));
}
