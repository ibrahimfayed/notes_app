import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:notes_app/constants.dart';
//import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
//import 'package:notes_app/views/widgets/colors_list_view.dart';
//import 'package:notes_app/views/widgets/add_note_form.dart';
import 'package:notes_app/views/widgets/custum_app_bar.dart';
//import 'package:notes_app/views/widgets/custum_button.dart';
import 'package:notes_app/views/widgets/custum_text_field.dart';
import 'package:notes_app/views/widgets/edit_note_colors_list_view.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  
  String?title,content;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
         children: [
      const SizedBox(height: 50,)
      ,CustumAppBar(
        onPressed: (){
          // if (title!=null) {
          //   widget.note.title = title!;
          // }
          // if (content!=null) {
          //   widget.note.subtitle = subtitle!;
          // }
          widget.note.title = title ?? widget.note.title;
          widget.note.subtitle = content ?? widget.note.subtitle;//it is the same as if above
          widget.note.save();
          BlocProvider.of<NotesCubit>(context).FetchAllNotes();
          Navigator.pop(context);

        },
        title: 'Edit Note',
        icon: Icons.check,
      ),
      const SizedBox(height: 32,),
       CustumTextField(
            onChanged: (value){
              title = value;
            },
              hint: widget.note.title,
            ),
      const SizedBox(height: 16,),
       CustumTextField(
              hint: widget.note.subtitle,
              maxLines: 5,
              onChanged: (value) {
              
              content = value;
              },
            ),
     
      const SizedBox(height: 40,),
      // ColorsListView(),
      EditNoteColorsList(
        note: widget.note,
      )
           
         ],
      ),
    );
  }
}
