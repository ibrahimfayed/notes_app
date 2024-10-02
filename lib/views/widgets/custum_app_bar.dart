import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custum_search_icon.dart';

class CustumAppBar extends StatelessWidget {
  const CustumAppBar({super.key, required this.title, required this.icon, this.onPressed});

final String title;
final IconData icon;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
        children:  [
          
          Text(
            title,
          style:const TextStyle(
           fontSize: 25
          ), ),
          const Spacer()
           ,
           CustumSearchIcon(
            onPressed: onPressed,
            icon: icon ,
           )
        ],
    );
  }
}
