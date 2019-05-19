class Client {
  final String firstName;
  final String lastName;
  final int status;
  final int id;
  final String telnum;
  final int height;
  final int weigth;
  List<Diagnosis> problems;
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

  Client.fromJson(Map<String, dynamic> json, List<Diagnosis> prob)
      : firstName = json['firstname'],
        lastName = json['lastname'],
        status = json['status'],
        id = json['id'],
        telnum = json['telnum'],
        height = json['height'],
        weigth = json['weight'],
        pressure = json['pressure'],
        problems = prob,
        temperature = json['temperature'];

  Map<String, dynamic> toJson() => {
        'weight': weigth ?? '',
        'pressure': pressure ?? '',
        'temperature': temperature ?? ''
      };
}

class Diagnosis {
  final String name;
  final String date;

  Diagnosis(this.name, this.date);

  Diagnosis.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        date = json['date'];
}
