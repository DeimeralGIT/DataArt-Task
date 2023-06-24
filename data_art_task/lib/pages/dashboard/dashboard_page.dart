import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../store/actions.dart';
import '../../store/store.dart';
import '../../utils/app_colors.dart';
import '../transaction_list/transaction_list_page.dart';
import '../transaction_overview/transaction_overview_page.dart';
import 'widgets/navigation_bar_button.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  final pageViewController = PageController();

  void animateToPage(int index) => index != store.state.pageViewIndex
      ? store.dispatch(
          AnimateToPageAction(() {
            pageViewController.animateToPage(
              index,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
            store.state.pageViewIndex = index;
          }),
        )
      : null;

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: AppColors.backgroundDim,
          ),
          child: Row(
            children: [
              NavigationBarButton(
                onTap: animateToPage,
                title: 'transaction.transactions',
                index: 0,
              ),
              const Gap(16),
              NavigationBarButton(
                onTap: animateToPage,
                title: 'transaction.overview',
                index: 1,
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.background,
        body: PageView(
          controller: pageViewController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            TransactionListPage(),
            TransactionOverviewPage(),
          ],
        ),
      ),
    );
  }
}
