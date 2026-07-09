import 'package:intl/intl.dart';

/// Formateadores comunes para fechas, moneda y números.
/// Requiere el paquete `intl` en pubspec.yaml.
class AppFormatters {
  AppFormatters._();

  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  static final DateFormat _dateTimeFormat = DateFormat('dd/MM/yyyy HH:mm');
  static final NumberFormat _currencyFormat =
      NumberFormat.currency(locale: 'es_PE', symbol: 'S/ ');
  static final NumberFormat _decimalFormat =
      NumberFormat.decimalPattern('es_PE');

  static String date(DateTime date) => _dateFormat.format(date);

  static String dateTime(DateTime date) => _dateTimeFormat.format(date);

  static String currency(num value) => _currencyFormat.format(value);

  static String decimal(num value, {int decimals = 2}) {
    final format = NumberFormat.decimalPattern('es_PE')
      ..maximumFractionDigits = decimals
      ..minimumFractionDigits = 0;
    return format.format(value);
  }

  static String percent(num value, {int decimals = 1}) {
    return '${value.toStringAsFixed(decimals)}%';
  }

  static String hectareas(num value) => '${decimal(value)} ha';

  static String kilogramos(num value) => '${decimal(value)} kg';
}
