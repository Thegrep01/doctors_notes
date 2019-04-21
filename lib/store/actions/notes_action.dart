import 'package:doctor_notes/models/note_model.dart';
import 'package:flutter/widgets.dart';

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

class CreateNotePending {
  final Note payload;
  final BuildContext context;

  CreateNotePending(this.payload, this.context);
}
