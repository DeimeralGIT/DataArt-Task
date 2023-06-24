import 'package:auto_route/auto_route.dart';
import 'package:data_art_task/utils/context_extensions.dart';
import 'package:data_art_task/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/transaction_type.dart';
import '../../store/store.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../transaction_list/widgets/receipt_row_widget.dart';
import 'widgets/pie_chart_widget.dart';

@RoutePage()
class TransactionOverviewPage extends StatelessWidget {
  const TransactionOverviewPage({super.key});

  double totalValue(TransactionType type) {
    return store.state.transactions.fold(
      0,
      (previousValue, transaction) =>
          previousValue += transaction.type == type ? transaction.value : 0,
    );
  }

  double get totalTransfer => totalValue(TransactionType.TRANSFER);

  double get totalDeposit => totalValue(TransactionType.DEPOSIT);

  double get totalWithdrawal => totalValue(TransactionType.WITHDRAWAL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'transaction.overview'.tr(),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PieChartWidget(),
                const Gap(32),
                ReceiptRowWidget(
                  label: 'overview.totalTransfer',
                  value: '\$ ${totalTransfer.roundifyDouble}',
                ),
                const Gap(16),
                ReceiptRowWidget(
                  label: 'overview.totalDeposit',
                  value: '\$ ${totalDeposit.roundifyDouble}',
                ),
                const Gap(16),
                ReceiptRowWidget(
                  label: 'overview.totalWithdrawal',
                  value: '\$ ${totalWithdrawal.roundifyDouble}',
                ),
                const Gap(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
