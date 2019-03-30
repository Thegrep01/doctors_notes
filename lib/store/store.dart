import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import './reducers/reducer.dart';
import 'package:doctor_notes/store/middlewares/login_epic.dart';
import 'package:doctor_notes/store/middlewares/client_epic.dart';

var loginMiddleware = EpicMiddleware(loginEpic);
var clientMiddleware = EpicMiddleware(clientEpic);

final store = Store<AppState>(appStateReducer,
    initialState: AppState([]),
    middleware: [loginMiddleware, clientMiddleware]);
