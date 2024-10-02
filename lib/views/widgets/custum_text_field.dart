import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustumTextField extends StatelessWidget {
  const CustumTextField({
    super.key, required this.hint, this.maxLines=1, this.onSaved, this.onChanged });//defult value maxLines=1 
final String hint;
final int maxLines;
final void Function(String?)? onSaved;//may be nullable so i don't make it required
final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator:(value){
     if (value?.isEmpty ?? true) {//??means that if value?.isEmpty==null then true
       return 'field is required';
     }else{
      return null;
     }
      } ,//if i work on a lot of text field prefered to recieve it
      maxLines: maxLines,
      cursorColor: kPrimarycolor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: kPrimarycolor
        ),
       // border: buildBorder(),
        enabledBorder: buildBorder()
        ,focusedBorder: buildBorder(kPrimarycolor)
          

        )
      );
  }
}
 OutlineInputBorder buildBorder([color]){
  return OutlineInputBorder(
     borderRadius: BorderRadius.circular(16),
     borderSide: BorderSide(
      color: color?? Colors.white
     ));
 }