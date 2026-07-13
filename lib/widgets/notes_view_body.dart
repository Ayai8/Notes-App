import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/note_cubit.dart';
import 'package:notes_app/widgets/appbar.dart';
import 'package:notes_app/widgets/notes_listview.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {

  bool isSearching = false;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Column(
        children: [

          const SizedBox(height: 50),

          CustomAppBar(
            title: isSearching ? '' : 'Notes',
            icon: isSearching
                ? Icons.close
                : Icons.search,

            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });

              if (!isSearching) {
                controller.clear();
                context.read<NotesCubit>().fetchNotes();
              }
            },
          ),

          if (isSearching)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search notes...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  context
                      .read<NotesCubit>()
                      .searchNotes(value);
                },
              ),
            ),

          const SizedBox(height: 10),

          const Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}