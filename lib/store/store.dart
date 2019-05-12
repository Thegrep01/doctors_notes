import 'package:doctor_notes/store/middlewares/client_epic.dart';
import 'package:doctor_notes/store/middlewares/login_epic.dart';
import 'package:doctor_notes/store/middlewares/note_epic.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import './reducers/reducer.dart';

var loginMiddleware = EpicMiddleware(loginEpic);
var clientMiddleware = EpicMiddleware(clientEpic);
var noteMiddleware = EpicMiddleware(noteEpic);
var createNoteMiddleware = EpicMiddleware(createNoteEpic);

final store = Store<AppState>(appStateReducer,
    initialState: AppState([], [], null),
    middleware: [
      loginMiddleware,
      clientMiddleware,
      noteMiddleware,
      createNoteMiddleware
    ]);
