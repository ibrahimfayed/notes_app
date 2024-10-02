import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
//import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(
      NoteModelAdapter()); //to tell hive that i treat with model adaptor and it must be before openbox because it send an exception hive error can't read unknown id did you forget the register adaptor
  await Hive.openBox<NoteModel>(
      kNotesBox); //to fix this error failed HiveError: The box "notes_box" is already open and of type Box<dynamic>. i add the <NoteModel>

  runApp(const Notes_app());
}

class Notes_app extends StatelessWidget {
  const Notes_app({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins' //to use it in all app
            ),
        home: NotesView(),
      ),
    );
  }
}
//exception of null check operator used in a null value that you used ! and it is null