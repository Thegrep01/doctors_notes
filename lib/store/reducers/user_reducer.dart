import 'package:doctor_notes/store/actions/login_actions.dart';

dynamic loginReducer(state, action) {
  if (action is LoginPending) {
    print(action.payload);
    return state;
  }

  if (action is LoginSuccess) {
    return state;
  }

  if (action is LoginFail) {
    return null;
  }

  return state;
}
