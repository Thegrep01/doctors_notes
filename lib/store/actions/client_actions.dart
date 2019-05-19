import 'package:doctor_notes/models/client_model.dart';

class GetClientsPending {
  final int docId;
  final int status;

  GetClientsPending({this.docId, this.status});
}

class GetClientsSuccess {
  final List<Client> payload;

  GetClientsSuccess(this.payload);
}

class GetClientsFail {
  GetClientsFail();
}

class GetClientPending {
  final int payload;

  GetClientPending(this.payload);
}

class GetClientSuccess {
  final Client payload;

  GetClientSuccess(this.payload);
}

class GetClientFail {
  GetClientFail();
}

class UpdateClient {
  final int id;
  final Client payload;

  UpdateClient({this.id, this.payload});
}

class UpdateSuccess {
  final Client payload;

  UpdateSuccess(this.payload);
}
