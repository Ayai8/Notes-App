import 'package:notes_app/models/note_model.dart';

abstract class AddNoteState {}

class NotesInitial extends AddNoteState {}

class AddNotesLoading extends AddNoteState {}

class AddNotesSuccess extends AddNoteState {
  final List<NoteModel> notes;

  AddNotesSuccess(this.notes);
}

class AddNotesFailure extends AddNoteState {
  final String error;

  AddNotesFailure(this.error);
}