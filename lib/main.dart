import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/cubit/addnotes_cubit.dart';
import 'package:notes_app/cubit/note_cubit.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();

  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>('notes');

  runApp(const MyNotesApp());
}

class MyNotesApp extends StatelessWidget {
  const MyNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
        BlocProvider(
          create: (context) => NotesCubit()..fetchNotes(),
        
       
    
    child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme:
              GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        ),
        home: const NotesView(),
      ),
    );
  }
}