import 'package:doctor_notes/common/datepicker.dart';
import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/common/mockdata.dart';
import 'package:doctor_notes/models/client_model.dart';
import 'package:doctor_notes/models/note_model.dart';
import 'package:doctor_notes/store/actions/client_actions.dart';
import 'package:doctor_notes/store/actions/notes_action.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:doctor_notes/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel {
  final Function createNote;
  final Client client;
  final Function updateClient;
  final List<String> dates;

  _ViewModel({this.createNote, this.client, this.updateClient, this.dates});
}

class CreateScreen extends StatefulWidget {
  final int clId;
  final String name;

  CreateScreen(this.clId, this.name);

  @override
  _CreateSreenState createState() => _CreateSreenState();
}

class _CreateSreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();
  String _codeSelection;
  TextEditingController _medication = TextEditingController(text: '');
  TextEditingController _note = TextEditingController(text: '');
  TextEditingController _diagnos = TextEditingController(text: '');
  TextEditingController _weigth = TextEditingController(text: '');
  TextEditingController _pressure = TextEditingController(text: '');
  TextEditingController _temperature = TextEditingController(text: '');

  final dropdownActivityGoals = MockData.codeItems
      .map((String item) =>
          DropdownMenuItem<String>(value: item, child: Text(item)))
      .toList();

  @override
  void initState() {
    store.dispatch(GetClientPending(widget.clId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(
          dates: store.state.dates,
          client: store.state.client,
          updateClient: (int id, data) =>
              store.dispatch(UpdateClient(id: id, payload: data)),
          createNote: (Note note, context, diagnos) =>
              store.dispatch(CreateNotePending(note, context, diagnos))),
      builder: (context, state) {
        return Scaffold(
          appBar: header(title: 'Create Note'),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  DatePickers(),
                  Divider(color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Activity code',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _codeSelection,
                            items: dropdownActivityGoals,
                            onChanged: (s) {
                              setState(
                                () {
                                  _codeSelection = s;
                                },
                              );
                            },
                          ),
                        ),
                        Center(
                          child: FlatButton(
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              'Client info',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _dialog(
                                  context, state.client, state.updateClient);
                            },
                          ),
                        ),
                        TextFormField(
                          controller: _medication,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(hintText: 'Medication'),
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          controller: _diagnos,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(hintText: 'Diagnos'),
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          controller: _note,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(hintText: 'Note'),
                        ),
                        SizedBox(height: 25),
                        Center(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            color: Color.fromRGBO(20, 137, 124, 1),
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              state.createNote(
                                Note(
                                    title: widget.name,
                                    clientId: widget.clId,
                                    activityCode: _codeSelection,
                                    medication: _medication.text,
                                    note: _note.text,
                                    dateService: state.dates[0],
                                    startTime: state.dates[1],
                                    endTime: state.dates[2]),
                                context,
                                _diagnos.text,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _dialog(BuildContext context, Client client, update) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextFormField(
                    initialValue: client.height.toString(),
                    enabled: false,
                    decoration: InputDecoration(prefix: Text('Height  ')),
                  ),
                  TextFormField(
                    controller: this._weigth,
                    initialValue:
                        client.weigth != null ? client.weigth.toString() : '0',
                    decoration: InputDecoration(
                        prefix: Text('Weigth  '), hintText: 'Weigth'),
                  ),
                  TextFormField(
                    controller: this._pressure,
                    initialValue: client.pressure != null
                        ? client.pressure.toString()
                        : '0',
                    decoration: InputDecoration(
                        prefix: Text('Pressure  '), hintText: 'Pressure'),
                  ),
                  TextFormField(
                    controller: this._temperature,
                    initialValue: client.temperature.toString(),
                    decoration: InputDecoration(prefix: Text('Temperature  ')),
                  ),
                  RaisedButton(
                    child: Text(
                      'Ok',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      update(
                          client.id,
                          Client(
                              temperature: _temperature.text,
                              pressure: _pressure.text,
                              weigth: int.parse(_weigth.text)));
                    },
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            elevation: 0.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          );
        });
  }
}
