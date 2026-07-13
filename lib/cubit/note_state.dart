import 'package:notes_app/models/note_model.dart';

abstract class NoteState {}

class NotesInitial extends NoteState {}

class NotesLoading extends NoteState {}

class NotesSuccess extends NoteState {
  final List<NoteModel> notes;

  NotesSuccess(this.notes);
}

class NotesFailure extends NoteState {
  final String error;

  NotesFailure(this.error);
}