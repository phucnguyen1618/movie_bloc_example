import 'package:intl/intl.dart';

class AppUtils {
  static String formatDateTime(String input) {
    var result = input.split('-');
    return DateFormat.yMMMMd('en_US').format(DateTime(
        int.parse(result[0].toString()),
        int.parse(result[1].toString()),
        int.parse(result[2].toString())));
  }

  static formatMoney(double value) {
    var numberFormat = NumberFormat.currency(name: 'USD').format(value);
    return numberFormat;
  }
}
