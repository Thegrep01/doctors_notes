import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/models/client_model.dart';
import 'package:doctor_notes/models/note_model.dart';
import 'package:doctor_notes/screens/clientDetails_screen.dart';
import 'package:doctor_notes/screens/create_screen.dart';
import 'package:doctor_notes/screens/noteDetails_screen.dart';
import 'package:doctor_notes/store/actions/client_actions.dart';
import 'package:doctor_notes/store/actions/notes_action.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:doctor_notes/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel {
  final List<Note> notes;
  final Function changeStatus;

  _ViewModel({this.notes, this.changeStatus});
}

class NoteListScreen extends StatefulWidget {
  final int clientId;
  final String clientName;
  final int status;

  NoteListScreen(this.clientId, this.clientName, this.status);

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
            changeStatus: (int id) => store.dispatch(
                UpdateClient(id: widget.clientId, payload: Client(status: 1)))),
        builder: (context, state) {
          return Scaffold(
              appBar: header(title: 'Doctor Notes', actions: [
                widget.status == 0
                    ? IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          state.changeStatus(widget.clientId);
                          store
                              .dispatch(GetClientsPending(docId: 1, status: 0));
                          Navigator.pop(context);
                        })
                    : Container(),
                IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ClientDetails(widget.clientId)));
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
                          child: item(state.notes[index], context));
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

Widget item(Note note, context) {
  return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NoteDetails(note.id)));
      },
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
