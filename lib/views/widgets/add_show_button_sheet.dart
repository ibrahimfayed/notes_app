import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';
//import 'package:notes_app/views/widgets/custum_button.dart';
//import 'package:notes_app/views/widgets/custum_text_field.dart';

class AddButtonSheet extends StatelessWidget {
  const AddButtonSheet({super.key});
//bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit,
              AddNoteState> //to use my states so i will take a different action
          (
        listener: (context, state) {
          if (state is AddNoteFailure) {
           // print('failed ${state.errormessage}');
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).FetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          
          // ModalProgressHUD(
          //     inAsyncCall: state is AddNoteLoading
          //         ? true
          //         : false, //it is in the loading insteed of creating isLoading variable
             return  AbsorbPointer(//to prevent user to make anything at screen
              absorbing: state is AddNoteLoading? true : false,
                
                child:  Padding(
                padding:  EdgeInsets.only(
                left: 16,
                right: 16,
                bottom : MediaQuery.of(context).viewInsets.bottom//to reach information about the device (height - weidth-...) and viewInsets is the information of the query
                     ),
                  child: const SingleChildScrollView(
                      child:
                          AddNoteForm()),
                //),
                ),
             ); //it should be under ModalProgressHUD to make no exception
        },
      ),
    );
  }
}
