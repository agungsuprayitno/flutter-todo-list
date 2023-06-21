import 'package:daily_notes/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? taskTittle;
  final String? taskSubTitle;
  final Function(bool?)? checkBoxCallBack;
  final Function()? ontap;
  final Function()? onTextTap;
  final String? formatedDate;

  TaskTile({
    @required this.taskTittle,
    @required this.taskSubTitle,
    @required this.isChecked,
    this.checkBoxCallBack,
    this.ontap,
    this.formatedDate,
    this.onTextTap,
  });

  @override
  Widget build(BuildContext context) {
    var taskTitleStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
        color: isChecked! ? Colors.black54 : Colors.greenAccent.shade700,
        fontWeight: FontWeight.bold,
        fontSize: isChecked! ? 17 : 20,
        decoration: isChecked! ? TextDecoration.lineThrough : null,
      ),
    );

    return ListTile(
      title: GestureDetector(
        onTap: onTextTap,
        child: Text(
          taskTittle!,
          textAlign: TextAlign.left,
          style: taskTitleStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            taskSubTitle!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(textStyle: kTaskSubtitleStyle),
          ),
          SizedBox(height: 2.0),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              formatedDate!,
              style: kDateTimeStyle,
            ),
          ),
        ],
      ),
      trailing: SizedBox(
        width: 80,
        child: Row(
          children: [
            Checkbox(
              activeColor: Colors.greenAccent.shade700,
              value: isChecked,
              onChanged: checkBoxCallBack,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: GestureDetector(
                onTap: ontap,
                child: Icon(
                  Icons.delete,
                  color: Colors.redAccent[100],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
