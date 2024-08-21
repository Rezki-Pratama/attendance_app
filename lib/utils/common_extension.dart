// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:attendance_app/features/common/app_localization.dart';
import 'package:attendance_app/utils/regex_util.dart';

extension ValidatorExt on String {
  bool isValidPassword() {
    return RegExp(RegexUtil.regexPassword).hasMatch(this);
  }

  bool isValidPIN() {
    return RegExp(RegexUtil.regexPin6Digit).hasMatch(this);
  }

  bool isValidKTP() {
    return RegExp(RegexUtil.regexKTP16Digit).hasMatch(this);
  }

  bool isValidEmail() {
    return RegExp(RegexUtil.regexEmail).hasMatch(this);
  }

  bool isValidPhone() {
    return RegExp(RegexUtil.regexPhoneNumber).hasMatch(this);
  }

  bool isValidPLNPrepaid() {
    return RegExp(RegexUtil.regexExactly11Digit).hasMatch(this);
  }
}

extension AssetStringExt on String {
  String loadString(
      {required BuildContext context, String errorString = 'Error'}) {
    try {
      return AppLocalizations.of(context)?.getText(this) ?? errorString;
    } catch (error) {
      debugPrint('$error');
      return errorString;
    }
  }
}

extension CapitalizationExt on String {
  String get inCaps =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get capitalizeFirstofEachChar => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}

extension MoneyFormatter on num {
  static final _currencyFormat = NumberFormat("#,##0", "id_ID");

  String toCurrencyFormat() {
    return _currencyFormat.format(this);
  }
}

extension IntegerValidation on int {
  bool isTrue() {
    if (this == 1) {
      return true;
    } else {
      return false;
    }
  }
}

extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

extension DateTimeStringFormatting on String {
  String formatDateUsingLocalization() {
    try {
      DateTime dateTime = DateFormat("yyyy-MM-dd").parse(this);
      return DateFormat.yMMMEd().format(dateTime);
    } catch (e) {
      return "";
    }
  }

  String formatTimeUsingLocalization() {
    try {
      DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
      return DateFormat.Hm().format(dateTime);
    } catch (e) {
      return "";
    }
  }
}
