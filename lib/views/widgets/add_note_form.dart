import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custum_button.dart';
import 'package:notes_app/views/widgets/custum_text_field.dart';
import 'package:intl/intl.dart';


class AddNoteForm extends StatefulWidget {
  //here i will get the input
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

final GlobalKey<FormState> formkey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode
    .disabled; //to show for me if there is an error in validation
String? title, subtitle;

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode:
          autovalidateMode, //i want to change this value so i make the widget stateful
      child: Column(
        //it is prefered to make it scrollable so use SingleChildScrollView
        children: [
          const SizedBox(
            height: 32,
          ),
          CustumTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustumTextField(
            onSaved: (value) {
              subtitle =
                  value; //warning if i make value = subtitle it will send an exception because it is very wrong
            },
            hint: 'content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 22,
          ),
        const ColorsListView(),
        const SizedBox(height: 22,),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustumButton(
                isLoading: state is AddNoteLoading ? true : false ,
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentDate = DateTime.now();
                    //var formateedCurrentDate = DateFormat('dd-mm-yyyy').format(currentDate);
                    var formateedCurrentDate = DateFormat.yMd().format(currentDate);
                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formateedCurrentDate,
                        color: Colors.blue
                            .value); //Colors.blue.value it returns the int of the color
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
