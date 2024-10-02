import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custum_app_bar.dart';
//import 'package:notes_app/views/widgets/note_item.dart';
import 'package:notes_app/views/widgets/notes_list_view.dart';

class Notes_view_body extends StatefulWidget {
  const Notes_view_body({super.key});

  @override
  State<Notes_view_body> createState() => _Notes_view_bodyState();
}

class _Notes_view_bodyState extends State<Notes_view_body> {
  // void initState() {
  //   BlocProvider.of<NotesCubit>(context).fethcAllNotes();
  //   super.initState();
  // }
  void initState(){
    BlocProvider.of<NotesCubit>(context).FetchAllNotes();
  }


  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustumAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          Expanded(child: NotesListView())//i should use expanded widget to void exception
         // to use expanded widget i should put it inside a widget of type flex like column or row not stack
        ],
      ),
    );
  }
}

