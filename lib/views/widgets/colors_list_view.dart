import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
 
 final Color color;
 final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive?
    CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 34,
      ),
    )
     : CircleAvatar(
      backgroundColor: color,
      radius: 38,
    );
  }
}
class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

int CurrentIndex = 0;
// List<Color>colors =const [
//   Color(0xffDDFCAD),
//   Color(0xffc8e087),
//   Color(0xff95a472),
//   Color(0xff82846d),
//   Color(0xff646165)

// ];
class _ColorsListViewState extends State<ColorsListView> {
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
              BlocProvider.of<AddNoteCubit>
              (context).color =kColors[index];
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