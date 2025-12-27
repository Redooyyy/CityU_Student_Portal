class HelperFunctions {
  static const List<String> weekDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  static const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  Map<String, String> getDateInfo({int offsetDays = 0}) {
    final date = DateTime.now().add(Duration(days: offsetDays));

    return {
      'day': weekDays[date.weekday - 1],
      'date': date.day.toString(),
      'month': months[date.month - 1],
    };
  }
}
