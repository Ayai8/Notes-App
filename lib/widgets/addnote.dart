import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubit/addnotes_cubit.dart';
import 'package:notes_app/cubit/note_cubit.dart';
import 'package:notes_app/cubit/notes_state.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNotesSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.pop(context);
          }

          if (state is AddNotesFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNotesLoading,
            child: AbsorbPointer(
              absorbing: state is AddNotesLoading,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom, // for keyboard
                ), 
                child: const SingleChildScrollView(
                  child: MakeNote(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}