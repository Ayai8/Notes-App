import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/colors.dart';
import 'package:notes_app/cubit/addnotes_cubit.dart';
import 'package:notes_app/cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/custombutton.dart';
import 'package:intl/intl.dart';

class MakeNote extends StatefulWidget {
  const MakeNote({super.key});

  @override
  State<MakeNote> createState() => _MakeNoteState();
}

class _MakeNoteState extends State<MakeNote> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 32),

              CustomTextField(
                hint: 'Title',
                onSaved: (value) {
                  title = value;
                },
              ),
              
              const SizedBox(height: 16),

              CustomTextField(
                hint: 'Content',
                maxLines: 5,
                onSaved: (value) {
                  subtitle = value;
                },
              ),
              const SizedBox(height: 32),
               ColorListview(),
              const SizedBox(height: 32),

              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is AddNotesLoading,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        var noteModel = NoteModel(
                          title: title!,
                          subtitle: subtitle!,
                          date: DateFormat(
                            'MMM d, yyyy',
                          ).format(DateTime.now()),
                          color: Colors.pinkAccent.value,
                        );

                        BlocProvider.of<AddNoteCubit>(
                          context,
                        ).addNote(noteModel);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  );
                },
              ),

              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}


