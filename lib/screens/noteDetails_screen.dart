import 'package:doctor_notes/common/datepicker.dart';
import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/models/note_model.dart';
import 'package:doctor_notes/store/actions/notes_action.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:doctor_notes/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel {
  final Note note;

  _ViewModel({this.note});
}

class NoteDetails extends StatefulWidget {
  final int id;

  NoteDetails(this.id);

  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  @override
  void initState() {
    store.dispatch(GetNoteInfo(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(note: store.state.note),
      builder: (context, state) {
        return Scaffold(
          appBar: header(title: 'Create Note'),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: state.note == null
                  ? CircularProgressIndicator()
                  : ListView(
                      children: <Widget>[
                        DatePickers(
                          selectedNoteData: [
                            state.note.dateService,
                            state.note.startTime,
                            state.note.endTime
                          ],
                        ),
                        Divider(color: Colors.black),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  'Activity code: ${state.note.activityCode ?? ''}'),
                              SizedBox(height: 25),
                              TextFormField(
                                enabled: false,
                                maxLines: null,
                                initialValue: state.note.medication ?? '',
                                keyboardType: TextInputType.multiline,
                                decoration:
                                    InputDecoration(hintText: 'Medication'),
                              ),
                              SizedBox(height: 25),
                              TextFormField(
                                enabled: false,
                                initialValue: state.note.note ?? '',
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(hintText: 'Note'),
                              ),
                              SizedBox(height: 25),
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
