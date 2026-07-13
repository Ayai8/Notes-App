import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/colors.dart';
import 'package:notes_app/cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 50),

          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title =
                  title ?? widget.note.title;

              widget.note.subtitle =
                  content ?? widget.note.subtitle;

              // saves the changed color too
              widget.note.save();

              BlocProvider.of<NotesCubit>(context).fetchNotes();

              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 50),

          CustomTextField(
            hint: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),

          const SizedBox(height: 16),

          CustomTextField(
            hint: widget.note.subtitle,
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),

          const SizedBox(height: 16),

          ColorListview(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}