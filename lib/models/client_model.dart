class MyClient {
  final String firstName;
  final String lastName;
  final int status;
  final String id;
  final String telnum;

  MyClient({this.firstName, this.lastName, this.status, this.id, this.telnum});

  MyClient.fromJson(Map<String, dynamic> json)
      : firstName = json['firstname'],
        lastName = json['lastname'],
        status = json['status'],
        id = json['id'],
        telnum = json['telnum'];
}
