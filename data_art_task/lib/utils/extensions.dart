export 'package:easy_localization/easy_localization.dart';

extension DateFormatter on DateTime {
  String get dateString => '$day/$month $hour:$minute';
}
