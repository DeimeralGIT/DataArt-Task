import 'package:auto_route/auto_route.dart';
import 'package:data_art_task/utils/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gap/gap.dart';
import 'package:redux/redux.dart';

import '../../models/transaction_model.dart';
import '../../store/store.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/transaction_widget.dart';

@RoutePage()
class TransactionListPage extends StatelessWidget {
  const TransactionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<TransactionModel>>(
      converter: (Store<AppState> store) {
        return store.state.transactions;
      },
      builder: (BuildContext context, List<TransactionModel> transactions) {
        return Scaffold(
          appBar: CustomAppBar(
            titleText: 'transaction.transactionsQuantity'.tr(
              namedArgs: {
                'quantity': transactions.length.toString(),
              },
            ),
            automaticallyImplyLeading: false,
          ),
          backgroundColor: AppColors.background,
          body: SizedBox(
            width: context.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 32),
                itemCount: transactions.length,
                separatorBuilder: (_, __) => const Gap(16),
                itemBuilder: (_, index) => TransactionWidget(
                  transaction: transactions[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
