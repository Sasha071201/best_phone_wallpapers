import 'package:intl/intl.dart';

DateTime? parseDateFromString(String? rawDate) {
  if (rawDate == null || rawDate.isEmpty) return null;
  return DateTime.tryParse(rawDate);
}

String stringFromDate(DateTime? date) {
  final dateFormatHm = DateFormat.Hm();
  return date != null
      ? '${dateFormatHm.format(date)} (${date.year}-${date.month}-${date.day})'
      : '';
}
