import 'package:intl/intl.dart';

String currentDAta(currentData) {
  String formatTime = DateFormat.yMd().format(currentData);
  return formatTime;
}
