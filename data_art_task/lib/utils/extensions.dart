export 'package:easy_localization/easy_localization.dart';

extension DateFormatter on DateTime {
  String get dateString => '$day/$month $hour:$minute';
}

extension PriceFormatter on double {
  String get roundifyDouble {
    final res = ((this * 100).round() / 100).toString();

    return res.endsWith('.0') ? res.replaceAll('.0', '') : res;
  }
}
