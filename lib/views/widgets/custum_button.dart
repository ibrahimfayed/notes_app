import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustumButton extends StatelessWidget {
  const CustumButton({super.key, this.ontap,  this.isLoading = false});

final void Function()? ontap;
final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimarycolor,
          borderRadius: BorderRadius.circular(16)
        ),
        width: MediaQuery.of(context).size.width,//to get the width of the screen and it is advanced
        height: 55,
        child: Center(child:
         isLoading ?const  SizedBox(
          height: 24,
          width: 24,
           child:  CircularProgressIndicator(
            color: Colors.black,
           ),
         ) : const Text('Add',
        style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold
        ),))
      ),
    );
  }
}