import 'package:daily_notes/constant.dart';
import 'package:daily_notes/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewTask extends StatefulWidget {
  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final _taskNameFormKey = GlobalKey<FormState>(debugLabel: 'taskDesState');
  final _taskDesFormKey = GlobalKey<FormState>(debugLabel: 'taskNameState');
  final _taskNameController = TextEditingController();
  final _taskDesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff737373),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add New",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
              ),
            ),
            Form(
              key: _taskNameFormKey,
              child: TextFormField(
                controller: _taskNameController,
                decoration: kTextFormFieldDecoration,
                autofocus: true,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  textStyle: kTextFormFieldStyle,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Todo';
                  }
                  return null;
                },
              ),
            ),
            Form(
              key: _taskDesFormKey,
              child: TextFormField(
                controller: _taskDesController,
                decoration:
                    kTextFormFieldDecoration.copyWith(hintText: 'Description.'),
                autofocus: true,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  textStyle: kTextFormFieldStyle,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Description.';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_taskNameFormKey.currentState!.validate()) {
                  if (_taskDesFormKey.currentState!.validate()) {
                    Provider.of<TaskData>(context, listen: false).addTask(
                      _taskNameController.text,
                      _taskDesController.text,
                      TaskData().formattedDate,
                    );
                    Navigator.pop(context);
                  }
                } else {
                  return null;
                }
              },
              child: Text(
                "Add",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
