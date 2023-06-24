import 'dart:ui';

import 'package:data_art_task/enums/transaction_type.dart';
import 'package:data_art_task/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:redux/redux.dart';

import '../../../models/transaction_model.dart';
import '../../../routes/app_router.dart';
import '../../../store/store.dart';
import '../../../store/transactions/transactions_actions.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_primary_button.dart';
import 'receipt_row_widget.dart';

class TransactionCheck extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCheck({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    void onCancelTransaction() => store.dispatch(
          CancelTransactionAction(
            transaction.id,
            () {
              router.pop().then(
                    (_) => showDialog(
                      context: context,
                      builder: (_) => CustomDialog(
                        title: 'transaction.transactionCancellation',
                        content: 'transaction.transactionCancelled'.tr(
                          namedArgs: {
                            'id': '${transaction.id}',
                          },
                        ),
                      ),
                    ),
                  );
            },
          ),
        );

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.background,
            border: Border.all(color: AppColors.secondary),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReceiptRowWidget(
                label: 'transaction.date',
                value: transaction.date.dateString,
              ),
              ReceiptRowWidget(
                label: 'transaction.value',
                value: '\$ ${transaction.value.toStringAsFixed(2)}',
              ),
              ReceiptRowWidget(
                label: 'transaction.commission',
                value: '\$ ${transaction.commission.toStringAsFixed(2)}',
              ),
              ReceiptRowWidget(
                label: 'transaction.total',
                value: '\$ ${transaction.total.toStringAsFixed(2)}',
              ),
              ReceiptRowWidget(
                label: 'transaction.id',
                value: '${transaction.id}',
              ),
              ReceiptRowWidget(
                label: 'transaction.type',
                value: transaction.type.title,
              ),
              const Gap(16),
              StoreConnector<AppState, bool>(
                converter: (Store<AppState> store) => store.state.isLoading,
                builder: (BuildContext context, bool isLoading) {
                  return CustomPrimaryButton(
                    onPressed: onCancelTransaction,
                    text: 'transaction.cancelTransaction',
                    color: AppColors.negative,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
