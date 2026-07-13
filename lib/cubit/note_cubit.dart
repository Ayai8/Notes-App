import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubit/note_state.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NotesInitial());

  final Box<NoteModel> notesBox = Hive.box<NoteModel>('notes');

  List<NoteModel> notes = [];


  void fetchNotes() {
    try {
      notes = notesBox.values.toList();

      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }


  void addNote(NoteModel note) {
    try {
      notesBox.add(note);

      // update the list immediately
      notes = notesBox.values.toList();

      emit(NotesSuccess(notes));

    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }


  void deleteNote(int index) {
    try {
      notesBox.deleteAt(index);

      fetchNotes();

    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }


  void searchNotes(String query) {

    if (query.trim().isEmpty) {
      emit(NotesSuccess(notes));
      return;
    }


    final result = notes.where((note) {

      final title = note.title.toLowerCase();
      final subtitle = note.subtitle.toLowerCase();
      final search = query.toLowerCase();


      return title.contains(search) ||
          subtitle.contains(search);

    }).toList();


    emit(NotesSuccess(result));
  }
}