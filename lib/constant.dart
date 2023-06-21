import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kTextFormFieldDecoration = InputDecoration(
  hintText: 'Name',
  hintStyle: GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Colors.grey,
    ),
  ),
);

const kTextFormFieldStyle = TextStyle(
  color: Colors.black87,
  fontWeight: FontWeight.w500,
  fontSize: 16,
);
const kTaskSubtitleStyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: Colors.grey,
  fontSize: 14,
);

const kDateTimeStyle = TextStyle(
  fontSize: 11,
  color: Colors.blueGrey,
);

const kAlertTitleStyle = TextStyle(
  color: Colors.green,
  fontSize: 25,
  fontWeight: FontWeight.w600,
);
const kAlertDescStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
  color: Colors.blueGrey,
);
const kAlertButtonStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const kTextEmptyStyle = TextStyle(
  color: Colors.grey,
  fontSize: 18,
);

const KDialogButtonTextStyle = TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.bold,
);

var kDateContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
);
