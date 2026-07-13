import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubit/notes_state.dart';

import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(NotesInitial());
  Color color = Color(0xFFF8BBD0);

  final Box<NoteModel> notesBox = Hive.box<NoteModel>('notes');

  void addNote(NoteModel note) {
    note.color = color.value;
    emit(AddNotesLoading());

    try {
      notesBox.add(note);
      emit(AddNotesSuccess(notesBox.values.toList()));
    } catch (e) {
      emit(AddNotesFailure(e.toString()));
    }
  }
}
