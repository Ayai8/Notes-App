import 'package:flutter/material.dart';
import 'package:notes_app/widgets/appbar.dart';
import 'package:notes_app/widgets/notes_item.dart';
import 'package:notes_app/widgets/notes_listview.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Column(
        children: [SizedBox(height: 50),
         CustomAppBar(), 
        Expanded(child: NotesListView())],
      ),
    );
  }
}


