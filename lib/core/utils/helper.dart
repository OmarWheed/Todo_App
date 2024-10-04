import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String currentDAta(currentData) {
  String formatTime = DateFormat.yMd().format(currentData);
  return formatTime;
}

String convertDate(String inputDate) {
  // Define the format of the input date (October 5, 2024)
  DateFormat inputFormat = DateFormat('MMMM d, yyyy');

  // Parse the input date string to DateTime object
  DateTime dateTime = inputFormat.parse(inputDate);

  // Define the format for the output date (2024/10/5)
  DateFormat outputFormat = DateFormat('MM/d/yyyy');

  // Convert the DateTime object to the desired output format
  String formattedDate = outputFormat.format(dateTime);

  return formattedDate;
}

Widget themeOfPicker(BuildContext context, Widget? child) {
  return Theme(
    data: ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(
        primary: Colors.white, // Change the header color
        onPrimary: Colors.black, // Change the text color on the header
        onSurface:
            Colors.green.withOpacity(0.9), // Change the color of the date text
      ),
      dialogBackgroundColor:
          Colors.green, // Change the background color of the dialog
    ),
    child: child!,
  );
}
