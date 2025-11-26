import 'package:intl/intl.dart';

abstract class FormateDate {
  static String formatDate(String? dateStr) {
    if (dateStr == null) {
      return DateFormat.yMMMMd('en_US').format(DateTime.now());
    } else {
      try {
        final date = DateTime.parse(dateStr);
        return DateFormat.yMMMMd('en_US').format(date);
      } catch (e) {
        return DateFormat.yMMMMd('en_US').format(DateTime.now());
      }
    }
  }
}
