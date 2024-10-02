import 'package:flutter/material.dart';

class CustumSearchIcon extends StatelessWidget {
  const CustumSearchIcon({super.key, required this.icon, this.onPressed});

final void Function()? onPressed;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),//may be 16 or 12 or 8
        color: Colors.white.withOpacity(0.05)
      ),
      child: IconButton(
        onPressed: onPressed,
         icon: Icon(
          icon,
          size: 28,),
        ),
      // child: Icon(
      //   icon,
      // size: 28,),
    );
  }
}
