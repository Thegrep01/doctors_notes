import 'package:doctor_notes/common/datepicker.dart';
import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/common/mockdata.dart';
import 'package:doctor_notes/models/note_model.dart';
import 'package:doctor_notes/store/actions/notes_action.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel {
  final Function createNote;

  _ViewModel({this.createNote});
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

  final dropdownActivityGoals = MockData.codeItems
      .map((String item) =>
          DropdownMenuItem<String>(value: item, child: Text(item)))
      .toList();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(
          createNote: (Note note, context) =>
              store.dispatch(CreateNotePending(note, context))),
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
                        FlatButton(
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            'Tests',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                        TextFormField(
                          controller: _medication,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(hintText: 'Medication'),
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
                                      note: _note.text),
                                  context);
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
}
