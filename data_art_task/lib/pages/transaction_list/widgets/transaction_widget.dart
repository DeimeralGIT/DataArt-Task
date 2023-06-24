import 'package:data_art_task/constants/transaction_type.dart';
import 'package:data_art_task/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../../models/transaction_model.dart';
import '../../../utils/app_colors.dart';
import 'receipt_row_widget.dart';
import 'transaction_check.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionWidget({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    void onTap() {
      showDialog(
        barrierColor: AppColors.transparent,
        context: context,
        builder: (_) => TransactionCheck(transaction: transaction),
      );
    }

    return ScaleTap(
      onPressed: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          border: Border.all(color: AppColors.primary),
        ),
        child: Row(
          children: [
            Tooltip(
              message: transaction.type.title.tr(),
              child: Icon(
                transaction.type.icon,
                color: AppColors.primary,
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(children: [
                ReceiptRowWidget(
                  label: 'transaction.id',
                  value: transaction.id.toString(),
                ),
                ReceiptRowWidget(
                  label: 'transaction.value',
                  value: '\$ ${transaction.value.toStringAsFixed(2)}',
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
