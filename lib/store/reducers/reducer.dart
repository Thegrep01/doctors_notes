import 'package:doctor_notes/models/client_model.dart';
import 'package:doctor_notes/models/note_model.dart';
import 'package:doctor_notes/store/reducers/client_reducer.dart';
import 'package:doctor_notes/store/reducers/note_reducer.dart';

class AppState {
  final List<Client> clients;
  final List<Note> notes;
  final Client client;
  final List<String> dates;

  AppState(this.clients, this.notes, this.client, this.dates);
}

AppState appStateReducer(AppState state, action) => AppState(
    clientsReducer(state.clients, action),
    noteReducer(state.notes, action),
    clientReducer(state.client, action),
    datesReducer(state.dates, action));
