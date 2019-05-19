import 'dart:async';

import 'package:doctor_notes/common/services/client.dart';
import 'package:doctor_notes/store/actions/client_actions.dart';
import 'package:redux_epics/redux_epics.dart';

Stream<dynamic> clientEpic(Stream<dynamic> actions, EpicStore<dynamic> store) {
  return actions.where((action) => action is GetClientsPending).asyncMap(
      (action) => getClients(action.docId, action.status).then((data) {
            return GetClientsSuccess(data);
          }).catchError((error) {
            return null;
          }));
}

Stream<dynamic> clientDetailEpic(
    Stream<dynamic> actions, EpicStore<dynamic> store) {
  return actions
      .where((action) => action is GetClientPending)
      .asyncMap((action) => getClient(action.payload).then((data) {
            return GetClientSuccess(data);
          }).catchError((error) {
            return null;
          }));
}

Stream<dynamic> updateClientDetailEpic(
    Stream<dynamic> actions, EpicStore<dynamic> store) {
  return actions.where((action) => action is UpdateClient).asyncMap(
      (action) => updateClient(action.id, action.payload).then((data) {
            return UpdateSuccess(data);
          }).catchError((error) {
            return null;
          }));
}
