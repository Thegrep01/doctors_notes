class User {
  final int id;
  final String firstname;
  final String lastname;
  final String token;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstname = json['firstname'],
        lastname = json['lastname'],
        token = json['token'];
}
