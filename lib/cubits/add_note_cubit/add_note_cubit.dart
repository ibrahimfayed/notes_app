import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';


class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color? color = Colors.red ;
  
  
  addNote(NoteModel note)async
  {note.color = color!.value;//color.value to convert the color into int
    emit(AddNoteLoading());

    try {
  var NotesBox = Hive.box<NoteModel>(kNotesBox);
  await NotesBox.add(note);
  emit(AddNoteSuccess());
} catch (e) {
  emit(AddNoteFailure(e.toString()));
}
  }
}
