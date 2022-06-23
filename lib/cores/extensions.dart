import 'package:intl/intl.dart';

extension DateTimeParsing on String {
  /// Convert String format 'dd/MM/yyyy' to DateTime
  DateTime parseDateTimeDDMMYYYY() {
    return DateFormat('dd/MM/yyyy').parse(this);
  }

  /// Convert String format 'yyyyMMddHHmm' to DateTime

  DateTime convertDateTimeTypeString() {
    int year = int.parse(this.substring(0, 4));
    int month = int.parse(this.substring(4, 6));
    int date = int.parse(this.substring(6, 8));
    int hour = int.parse(this.substring(8, 10));
    int min = int.parse(this.substring(10, 12));
    return DateTime(year, month, date, hour, min);
  }
}

extension DateTimeParsingDouble on double {
  /// Convert String format 'yyyyMMdd' to DateTime

  DateTime convertDateTimeTypeDouble() {
    String _stringValue = this.toInt().toString();
    int year = int.parse(_stringValue.substring(0, 4));
    int month = int.parse(_stringValue.substring(4, 6));
    int date = int.parse(_stringValue.substring(6, 8));

    return DateTime(year, month, date);
  }
}

extension StringParsing on DateTime {
  /// Convert DateTime to String format 'dd/MM'
  String formatDateDDMM() {
    return DateFormat('dd/MM').format(this);
  }

  /// Convert DateTime to String format 'yyyyMMdd'

  String convertDatetoYYYYMMDD() {
    String day = this.day.toString().padLeft(2, '0');
    String month = this.month.toString().padLeft(2, '0');
    int year = this.year;
    return '$year$month$day';
  }

  /// Convert DateTime to String format 'dd/MM/yyyy'

  String formatDateDDMMYYYY() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}

extension StringParsingDouble on double {
  String convertStringTypeDouble() {
    String _stringValue = this.toInt().toString();
    String year = _stringValue.substring(0, 4);
    String month = _stringValue.substring(4, 6);
    String date = _stringValue.substring(6, 8);

    return "$year/$month/$date";
  }
}

extension ValidateInput on String {
  ///  kiểm tra mật khẩu có 1 chữ hoa, 1 chữ thường 1 số và độ dài >=6
  bool checkValidatePassword() {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
        .hasMatch(this);
  }

  /// kiểm tra điều kiện nhập cmt 9 đến 13 ký tự
  ///
  ///  String pattern = r'^([0-9]{9}|[0-9]{12}|[A-Z]{1}[0-9]{7})$';
  ///
  ///  CMT 9 số hoặc CCCD 12 số hoặc Hộ chiếu 1 chữ cái in hoa và 7 số

  bool checkValidateCmt() {
    String pattern = r'^([0-9]{9}|[0-9]{12}|[A-Z]{1}[0-9]{7})$';

    RegExp regExp = new RegExp(pattern);
    return !regExp.hasMatch(this);
  }

  /// kiểm tra điều kiện nhập mã số thuế 10 đến 14 ký tự
  ///
  ///  String pattern = r'^(?:[+0]9)?[0-9\.\-\/]{10,14}$';
  ///
  ///  Mã số thuế 10 số với DN và 13 + '-' với cá nhân

  bool checkValidateMst() {
    String pattern = r'^([0-9]{10}|[0-9\.\-\/]{13,14})$';

    RegExp regExp = new RegExp(pattern);
    return !regExp.hasMatch(this);
  }

  /// kiểm tra điều kiện nhập số điện thoại 10 đến 11 ký tự
  ///
  /// String pattern = r'^(?:[+0]9)?[0-9]{10,11}$';
  ///
  /// Lỗi số điện thoại > 11 số
  ///
  /// Số điện thoại có 10 đến 11 số bắt đầu với 0 hoặc 84
  bool checkValidatePhone() {
    String pattern = r'^(0|84){1,2}?[0-9]{9}$';
    RegExp regExp = new RegExp(pattern);

    return !regExp.hasMatch(this);
  }

  /// kiểm tra điều kiện nhập email
  bool checkValidateEmail() {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(pattern);

    return !regExp.hasMatch(this);
  }
}
