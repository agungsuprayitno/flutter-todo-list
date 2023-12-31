import 'package:daily_notes/models/task_data.dart';
import 'package:daily_notes/screens/addnewTask.dart';
import 'package:daily_notes/screens/all_task.dart';
import 'package:daily_notes/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          color: Colors.white10,
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent.shade700,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddNewTask(),
                ),
              ),
            );
          }),
      backgroundColor: Colors.greenAccent.shade700,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, bottom: 30.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25.0,
                  child: IconButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllTask())),
                    icon: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.greenAccent.shade700,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Todo List",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${Provider.of<TaskData>(context).taskCount} List",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskLists(),
            ),
          ),
        ],
      ),
    );
  }
}
