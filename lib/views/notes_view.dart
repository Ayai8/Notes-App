import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/note_cubit.dart';

import 'package:notes_app/widgets/addnote.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 220, 170),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return const AddNote();
            },
          );
        },
        child: const Icon(Icons.add, color: Color.fromARGB(255, 213, 174, 107)),
      ),
      body: const NotesViewBody(),
    );
  }
}
