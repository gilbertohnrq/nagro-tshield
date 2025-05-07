// coverage:ignore-file
import 'package:intl/intl.dart';

mixin DateHelper {
  static const Map<int, String> monthsInYear = <int, String>{
    1: 'janeiro',
    2: 'fevereiro',
    3: 'marco',
    4: 'abril',
    5: 'maio',
    6: 'junho',
    7: 'julho',
    8: 'agosto',
    9: 'setembro',
    10: 'outubro',
    11: 'novembro',
    12: 'dezembro',
  };

  static String addZero(int value) {
    if (value.toString().isEmpty) {
      return '00';
    }

    if (value.toString().length == 1) {
      return '0$value';
    }

    return value.toString();
  }

  static String getFormatedDuoDate(String date) {
    final target = DateTime.parse(date);
    final formatDate = DateFormat('d/MM/y');
    return formatDate.format(target);
  }

  static String formatDateToTimeAgo(DateTime date) {
    final DateTime currentDate = DateTime.now().toLocal();
    final DateTime timezoneDate = date.toLocal();

    if (currentDate.year != timezoneDate.year) {
      final DateTime dateToCompare =
          DateTime(currentDate.year, currentDate.month - 12, currentDate.day);

      if (dateToCompare.millisecondsSinceEpoch >
          timezoneDate.millisecondsSinceEpoch) {
        final int year = currentDate.year - timezoneDate.year;
        return 'Há $year ${year == 1 ? "ano" : "anos"}';
      }
    }

    if (currentDate.month != timezoneDate.month) {
      int month = currentDate.month - timezoneDate.month;

      if (month < 0) {
        month += 12;
      }

      return 'Há $month ${month == 1 ? "mês" : "meses"}';
    }

    if (currentDate.day != timezoneDate.day) {
      final int days = currentDate.day - timezoneDate.day;
      return 'Há $days  ${days == 1 ? "dia" : "dias"}';
    }

    if (currentDate.hour != timezoneDate.hour) {
      int hours = currentDate.hour - timezoneDate.hour;

      if (hours < 0) {
        hours += 24;
      }

      return 'Há $hours horas';
    }

    int minutes = currentDate.minute - timezoneDate.minute;

    if (minutes < 0) {
      minutes += 60;
    }
    return 'Há $minutes min';
  }

  static String formatDateToDateAndHours(DateTime date,
      {String separator = 'às'}) {
    final DateTime timezoneDate = date.toLocal();
    return '${addZero(timezoneDate.day)}/${addZero(timezoneDate.month)}/${timezoneDate.year} $separator ${addZero(timezoneDate.hour)}:${addZero(timezoneDate.minute)}';
  }

  static String? getMonth(DateTime date) {
    return monthsInYear[date.month];
  }

  static String getMonthInitials(DateTime date) {
    return monthsInYear[date.month]!.substring(0, 3).toUpperCase();
  }

  static String getMonthAndYear(DateTime date) {
    return '${getMonthInitials(date)}/${date.year.toString().substring(2)}';
  }

  static String getHourAndMinuteWithTimezone(DateTime date) {
    final DateTime timezoneDate = date.toLocal();
    String hour = timezoneDate.hour.toString();
    String minute = timezoneDate.minute.toString();
    if (hour.length == 1) hour = '0$hour';
    if (minute.length == 1) minute = '0$minute';
    return '$hour:$minute';
  }

  static String addZeroIfNeed(int? value) {
    if (value.toString().length == 1) {
      return '0$value';
    }
    return value.toString();
  }

  static String getBrTimeDescription() {
    final int hour = DateTime.now().toLocal().hour;

    if (hour >= 0 && hour < 12) {
      return 'bom dia!';
    } else if (hour >= 12 && hour < 18) {
      return 'boa tarde!';
    } else {
      return 'boa noite!';
    }
  }

  static String formatDate(String date) {
    final DateTime dateTime = DateTime.parse(date);

    final String formatDate = DateFormat('dd/MM/yyyy').format(dateTime);

    return formatDate;
  }

  static String formatDateExtended(String dateString) {
    final DateTime date = DateTime.parse(dateString);
    return DateFormat("dd 'de' MMMM", 'pt_BR').format(date);
  }
}
