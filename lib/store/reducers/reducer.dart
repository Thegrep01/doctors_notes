import 'package:doctor_notes/models/client_model.dart';
import 'package:doctor_notes/models/note_model.dart';
import 'package:doctor_notes/store/reducers/client_reducer.dart';
import 'package:doctor_notes/store/reducers/note_reducer.dart';

class AppState {
  final List<Client> clients;
  final List<Note> notes;
  final Client client;
  final List<String> dates;
  final Note note;

  AppState(this.clients, this.notes, this.client, this.dates, this.note);
}

AppState appStateReducer(AppState state, action) => AppState(
      clientsReducer(state.clients, action),
      notesReducer(state.notes, action),
      clientReducer(state.client, action),
      datesReducer(state.dates, action),
      noteReducer(state.note, action),
    );
