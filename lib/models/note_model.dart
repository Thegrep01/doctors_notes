class Note {
  final int id;
  final String title;
  final String note;
  final String medication;
  final String date;
  final int clientId;
  final String activityCode;
  final String dateService;
  final String startTime;
  final String endTime;

  Note(
      {this.id,
      this.title,
      this.date,
      this.clientId,
      this.activityCode,
      this.medication,
      this.note,
      this.dateService,
      this.endTime,
      this.startTime});

  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        note = json['note'],
        medication = json['medication'],
        activityCode = json['activityCode'],
        date = json['date'],
        clientId = json['CLientID'],
        dateService = json['dateService'],
        endTime = json['endTime'],
        startTime = json['startTime'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'note': note,
        'medication': medication,
        'date': date,
        'clientId': clientId,
        'activityCode': activityCode,
        'dateService': dateService,
        'endTime': endTime,
        'startTime': startTime
      };
}
