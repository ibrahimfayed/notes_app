part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}
final class AddNoteLoading extends AddNoteState {}//const in all apps
final class AddNoteSuccess extends AddNoteState {}//const in all apps
final class AddNoteFailure extends AddNoteState {
  final String errormessage;

  AddNoteFailure(this.errormessage);

 
}//const in all apps

