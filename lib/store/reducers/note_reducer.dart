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
