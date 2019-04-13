import 'dart:async';
import 'package:doctor_notes/common/services/client.dart';
import 'package:doctor_notes/store/actions/client_actions.dart';
import 'package:doctor_notes/store/actions/notes_action.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> clientEpic(Stream<dynamic> actions, EpicStore<dynamic> store) {
  return actions.where((action) => action is GetClientPending).asyncMap(
      (action) => getClients(action.docId, action.status).then((data) {
            return GetClientSuccess(data);
          }).catchError((error) {
            return null;
          }));
}

Stream<dynamic> noteEpic(Stream<dynamic> actions, EpicStore<dynamic> store) {
  return actions
      .where((action) => action is GetNotesPending)
      .asyncMap((action) => getNotes(action.id).then((data) {
            return GetNotesSuccess(data);
          }).catchError((error) {
            return null;
          }));
}
