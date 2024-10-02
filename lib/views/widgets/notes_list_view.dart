import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_item.dart';


class NotesListView extends StatelessWidget {
  const NotesListView(
      {super.key}); //it is prefered if i want to remove const in this line make it statefull widget


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes??[];
        // print(notes);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
              padding: EdgeInsets.zero, //because listview has padding by defult
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: NoteItem(
                    note:notes[index] ,
                  ),
                );
              }),
        );
      },
    );
  }
}
///////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
// import 'package:notes_app/models/note_model.dart';
// import 'package:notes_app/views/widgets/note_item.dart';

// //worked
// class NotesListView extends StatelessWidget {
//   const NotesListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NotesCubit, NotesState>(
//       builder: (context, state) {
//         // Fetch notes from the NotesCubit
//         List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;

//         // Reverse the list to show the latest notes on top
//         final reversedNotes = notes.reversed.toList();

//         return Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 16,
//           ),
//           child: ListView.builder(
//             itemCount: reversedNotes.length,
//             padding: EdgeInsets.zero,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 4,
//                 ),
//                 child: NoteItem(
//                   note: reversedNotes[index],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
///////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
// import 'package:notes_app/views/widgets/custum_app_bar.dart';

// class NoteViewList extends StatefulWidget {
//   const NoteViewList({super.key});

//   @override
//   State<NoteViewList> createState() => _NoteViewListState();
// }

// class _NoteViewListState extends State<NoteViewList> {
//   @override
//   void initState() {
//     BlocProvider.of<NotesCubit>(context).fethcAllNotes();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             children: [
//               CustumAppBar(title: 'Note', icon: Icons.search),
//               Expanded(child: CustomListView()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
