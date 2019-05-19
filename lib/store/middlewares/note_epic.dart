import 'package:doctor_notes/common/services/note.dart';
import 'package:doctor_notes/store/actions/notes_action.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> notesEpic(Stream<dynamic> actions, EpicStore<dynamic> store) {
  return actions
      .where((action) => action is GetNotesPending)
      .asyncMap((action) => getNotes(action.id).then((data) {
            return GetNotesSuccess(data);
          }).catchError((error) {
            return null;
          }));
}

Stream<dynamic> noteEpic(Stream<dynamic> actions, EpicStore<dynamic> store) {
  return actions
      .where((action) => action is GetNoteInfo)
      .asyncMap((action) => getNote(action.payload).then((data) {
            return GetNoteInfoSuccess(data);
          }).catchError((error) {
            return null;
          }));
}

Stream<dynamic> createNoteEpic(
    Stream<dynamic> actions, EpicStore<dynamic> store) {
  return actions.where((action) => action is CreateNotePending).asyncMap(
      (action) => createNote(action.payload, action.context, action.diagnos)
              .then((data) {
            return GetNotesPending(action.payload.clientId);
          }).catchError((error) {
            return null;
          }));
}
