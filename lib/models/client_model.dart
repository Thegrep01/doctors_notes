class Client {
  final String firstName;
  final String lastName;
  final int status;
  final int id;
  final String telnum;

  Client({this.firstName, this.lastName, this.status, this.id, this.telnum});

  Client.fromJson(Map<String, dynamic> json)
      : firstName = json['firstname'],
        lastName = json['lastname'],
        status = json['status'],
        id = json['id'],
        telnum = json['telnum'];
}
