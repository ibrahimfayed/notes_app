import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
 late int CurrentIndex ;//i use late if tell me that the variable always nonulble
 @override
  void initState() {
    CurrentIndex = kColors.indexOf(Color(widget.note.color)); 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,//i must put its height to not return an error
        itemBuilder: (context,index){
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
              CurrentIndex = index;
              widget.note.color = kColors[index].value;
              // BlocProvider.of<AddNoteCubit>
              // (context).color = kColors[index];
              setState(() {
                
              });
            },
              child: ColorItem(
                color: kColors[index],
                isActive: CurrentIndex ==index,),
                ),
          );
        }),
    );
  }
}