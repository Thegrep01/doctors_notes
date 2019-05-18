import 'package:doctor_notes/store/actions/datePickers_actions.dart';
import 'package:doctor_notes/store/actions/notes_action.dart';

dynamic noteReducer(state, action) {
  if (action is GetNotesPending) {
    return state;
  }

  if (action is GetNotesSuccess) {
    return action.payload;
  }

  if (action is GetNotesFail) {
    return [];
  }

  return state;
}

dynamic datesReducer(state, action) {
  if (action is ConfirmDates) {
    state[0] = action.payload;
    return state;
  }
  if (action is ConfirmStartTime) {
    state[1] = action.payload;
    return state;
  }
  if (action is ConfirmEndTime) {
    state[2] = action.payload;
    return state;
  }
  return state;
}
