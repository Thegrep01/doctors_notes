import 'package:doctor_notes/store/actions/client_actions.dart';
import 'package:doctor_notes/store/actions/login_actions.dart';

dynamic clientReducer(state, action) {
  if (action is GetClientPending) {
    return state;
  }

  if (action is GetClientSuccess) {
    return action.payload;
  }

  if (action is LoginFail) {
    return null;
  }

  return state;
}
