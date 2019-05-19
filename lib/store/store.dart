import 'package:doctor_notes/store/middlewares/client_epic.dart';
import 'package:doctor_notes/store/middlewares/login_epic.dart';
import 'package:doctor_notes/store/middlewares/note_epic.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import './reducers/reducer.dart';

var loginMiddleware = EpicMiddleware(loginEpic);
var clientsMiddleware = EpicMiddleware(clientEpic);
var notesMiddleware = EpicMiddleware(notesEpic);
var noteMiddleware = EpicMiddleware(noteEpic);
var createNoteMiddleware = EpicMiddleware(createNoteEpic);
var clientMiddleware = EpicMiddleware(clientDetailEpic);

final store = Store<AppState>(appStateReducer,
    initialState: AppState([], [], null, [null, null, null], null),
    middleware: [
      loginMiddleware,
      clientsMiddleware,
      noteMiddleware,
      createNoteMiddleware,
      clientMiddleware,
      notesMiddleware
    ]);
