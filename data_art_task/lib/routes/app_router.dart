import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/authorization/authorization_create_password_page.dart';
import '../pages/authorization/authorization_email_page.dart';
import '../pages/authorization/authorization_password_page.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../pages/transaction_list/transaction_list_page.dart';
import '../pages/transaction_overview/transaction_overview_page.dart';

part 'app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(initial: true, page: AuthorizationEmailRoute.page),
    AutoRoute(page: AuthorizationPasswordRoute.page),
    AutoRoute(page: AuthorizationCreatePasswordRoute.page),
    AutoRoute(
      page: DashboardRoute.page,
      children: [
        AutoRoute(page: TransactionListRoute.page),
        AutoRoute(page: TransactionOverviewRoute.page),
      ],
    ),
  ];
}
