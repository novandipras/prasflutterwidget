import 'package:intl/intl.dart';

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String toPhoneNumber() {
    if (split('').first == '0') {
      return replaceFirst('0', '62');
    } else if ((split('').first != '0') &&
        (split('').first + split('')[1] != '62')) {
      return '62$this';
    } else {
      return this;
    }
  }

  String toHariTanggalanComplete({
    bool isNotTwentyFourFormat = false,
  }) {
    String hourFormat = isNotTwentyFourFormat ? 'K:mm a' : 'HH:mm';
    DateTime date = DateTime.parse(
      this,
    );

    String dateFormat = DateFormat(
      'EEE dd MMM yyy, $hourFormat',
      'id_ID',
    ).format(date);

    return dateFormat;
  }

  String toHariTanggalan({
    bool isWithComma = false,
  }) {
    DateTime date = DateTime.parse(
      this,
    );

    String dateFormat = DateFormat(
      isWithComma ? 'EEEE, dd MMM yyy' : 'EEEE dd MMM yyy',
      'id_ID',
    ).format(date);

    return dateFormat;
  }

  String toHariTanggalanSimpleDate({
    bool isMonthYearOnly = false,
  }) {
    if (isNotEmpty) {
      return DateFormat(
        isMonthYearOnly ? 'yyyy MMMM ' : 'dd MMMM yyyy ',
        'id_ID',
      ).format(
        (DateTime.parse(
          this,
        )),
      );
    } else {
      return this;
    }
  }

  String toHariTanggalanSimpleClock() {
    return DateFormat(
      'HH:mm',
      'id_ID',
    ).format(
      (DateTime.parse(
        this,
      )),
    );
  }
}

// ignore: camel_case_extensions
extension intExtension on double {
  String toRupiah({
    bool isShow = false,
  }) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    String formatted = currencyFormatter.format(this);
    if (isShow == true) {
      formatted = 'Rp **********${formatted.substring(formatted.length)}';
    }
    return formatted;
  }

  String toFormattedNumber() {
    final numberFormatter = NumberFormat('#,###', 'id_ID');
    String formatted = numberFormatter.format(this);
    return formatted;
  }
}

