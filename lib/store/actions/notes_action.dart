import 'package:doctor_notes/models/note_model.dart';

class GetNotesPending {
  final int id;
  GetNotesPending(this.id);
}

class GetNotesSuccess {
  final List<Note> payload;
  GetNotesSuccess(this.payload);
}

class GetNotesFail {
  GetNotesFail();
}
