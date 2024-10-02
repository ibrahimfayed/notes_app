
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});


  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context){
          return  EditNoteView(note: note);
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 10),//it make a space inner but wrap with padding make space outer
        decoration: BoxDecoration(
            color: Color(note.color),
             borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding:  EdgeInsets.only(bottom: 15),
                child: Text(
                  note.title,
                  style:const TextStyle(
                    color: Colors.black,
                    fontSize: 26
                    ),
                ),
              ),
              subtitle: Text(
                note.subtitle,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.3)
                  ,fontSize: 16
                  ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).FetchAllNotes();//this line to make a refresh
                },
                 icon: const Padding(
                   padding:  EdgeInsets.only(bottom: 24),
                   child: Icon(Icons.delete,
                               color: Colors.black,
                               size: 35,),
                 )),
            ),
           Padding(
              padding: const EdgeInsets.only(top: 16,right: 40),
              child: Text(
                note.date,
              style: const TextStyle(
                color: Colors.black
              ),),
            )
          ],
        ),
      ),
    );
  }
}