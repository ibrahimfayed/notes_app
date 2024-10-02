part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}
final class NotesSuccess extends NotesState{}
// final class NotesLoading extends NotesState {}//const in all apps
// final class NotesSuccess extends NotesState {
//   final List<NoteModel>notes;

//   NotesSuccess(this.notes);

 
// }//const in all apps
// final class NotesFailure extends NotesState {
//   final String errormessage;

//   NotesFailure(this.errormessage);

// }