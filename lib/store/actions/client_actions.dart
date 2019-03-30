import 'package:doctor_notes/models/client_model.dart';

class GetClientPending {
  final int docId;
  final int status;
  GetClientPending({this.docId, this.status});
}

class GetClientSuccess {
  final List<Client> payload;
  GetClientSuccess(this.payload);
}

class GetClientFail {
  GetClientFail();
}
