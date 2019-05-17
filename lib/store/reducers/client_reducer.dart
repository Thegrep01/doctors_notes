import 'package:doctor_notes/store/actions/client_actions.dart';
import 'package:doctor_notes/store/actions/login_actions.dart';

dynamic clientsReducer(state, action) {
  if (action is GetClientsPending) {
    return state;
  }

  if (action is GetClientsSuccess) {
    return action.payload;
  }

  if (action is LoginFail) {
    return null;
  }

  return state;
}

dynamic clientReducer(state, action) {
  if (action is GetClientPending) {
    return state;
  }

  if (action is GetClientSuccess) {
    print(action.payload.problems);
    return action.payload;
  }

  if (action is LoginFail) {
    return null;
  }

  return state;
}
