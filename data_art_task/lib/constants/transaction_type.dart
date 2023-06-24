// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

enum TransactionType {
  TRANSFER,
  DEPOSIT,
  WITHDRAWAL,
}

extension TransactionTools on TransactionType {
  String get title => 'enums.transactionTypes.$name';

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
