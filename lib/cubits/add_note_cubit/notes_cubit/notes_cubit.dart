import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  FetchAllNotes(){
   
  var NotesBox = Hive.box<NoteModel>(kNotesBox);
  notes = NotesBox.values.toList();//here i want to load all notes and data comes to me immediately so i don't need loading
  emit(NotesSuccess());

 
}
  }

