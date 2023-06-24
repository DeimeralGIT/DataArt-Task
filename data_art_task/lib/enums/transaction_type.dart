// ignore_for_file: constant_identifier_names
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum TransactionType {
  TRANSFER,
  DEPOSIT,
  WITHDRAWAL,
}

extension TransactionTools on TransactionType {
  String get title => 'enums.transactionTypes.$name'.tr();

  IconData get icon {
    switch (this) {
      case TransactionType.TRANSFER:
        return Icons.swap_horiz;
      case TransactionType.DEPOSIT:
        return Icons.arrow_downward;
      case TransactionType.WITHDRAWAL:
        return Icons.arrow_upward;
    }
  }
}
