class Note {
  final int id;
  final String title;
  final String body;
  final String date;
  final int clientId;

  Note(this.id, this.title, this.body, this.date, this.clientId);

  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        date = json['date'],
        clientId = json['CLientID'];
}
