import 'package:intl/intl.dart';

extension StringObject on String {
  String getFirstName() {
    return split(' ').first;
  }

  String getLastName() {
    return split(' ').last;
  }

  String stringDateToString(String format1, String format2) {
    if (isEmpty) return '';
    DateTime tempDate = DateFormat(format1).parse(this);
    String date = DateFormat(format2).format(tempDate);
    return date;
  }
}

extension FormattingDate on DateTime {
  String dateToFormattedString(String format) {
    return DateFormat(format).format(this);
  }
}
