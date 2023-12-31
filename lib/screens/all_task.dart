import 'package:daily_notes/constant.dart';
import 'package:daily_notes/models/task_data.dart';
import 'package:daily_notes/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllTask extends StatelessWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: Colors.greenAccent.shade700,
      elevation: 0.0,
      title: Text(
        'All Task',
        style: GoogleFonts.poppins(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Center(
              child: Text(
            "${Provider.of<TaskData>(context).taskCount} Task",
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Consumer<TaskData>(
        builder: (context, taskData, _) {
          if (taskData.taskCount == 0) {
            return Center(
              child: Text(
                "No data.",
                style: GoogleFonts.poppins(
                  textStyle: kTextEmptyStyle,
                ),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                isChecked: taskData.tasks[index].isDone,
                taskTittle: task.name,
                taskSubTitle: task.subname,
                formatedDate: task.date,
                checkBoxCallBack: (checkboxState) {
                  taskData.upDateTask(task);
                },
                ontap: () => taskData.alertMethod(context, task),
                onTextTap: () => taskData.dialogInfo(context, task),
              );
            },
            itemCount: taskData.taskCount,
          );
        },
      ),
    );
  }
}
