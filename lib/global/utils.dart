import 'package:intl/intl.dart';

class Utils {
  static String formatDate(String date) {
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    return dateFormat.format(toDateTime(date));
  }

  static DateTime toDateTime(String date) => DateTime.parse(date);
}
