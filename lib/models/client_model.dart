class Client {
  final String firstName;
  final String lastName;
  final int status;
  final int id;
  final String telnum;
  final int height;
  final int weigth;
  final problems;
  final String pressure;
  final String temperature;

  Client(
      {this.firstName,
      this.lastName,
      this.status,
      this.id,
      this.telnum,
      this.height,
      this.problems,
      this.weigth,
      this.pressure,
      this.temperature});

  Client.fromJson(Map<String, dynamic> json)
      : firstName = json['firstname'],
        lastName = json['lastname'],
        status = json['status'],
        id = json['id'],
        telnum = json['telnum'],
        height = json['height'],
        weigth = json['weigth'],
        problems = json['problems'],
        pressure = json['pressure'],
        temperature = json['temperature'];
}
