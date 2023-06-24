// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    TransactionListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransactionListPage(),
      );
    },
    TransactionOverviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransactionOverviewPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashboardPage(key: args.key),
      );
    },
    AuthorizationPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthorizationPasswordPage(),
      );
    },
    AuthorizationEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthorizationEmailPage(),
      );
    },
    AuthorizationCreatePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthorizationCreatePasswordPage(),
      );
    },
  };
}

/// generated route for
/// [TransactionListPage]
class TransactionListRoute extends PageRouteInfo<void> {
  const TransactionListRoute({List<PageRouteInfo>? children})
      : super(
          TransactionListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransactionOverviewPage]
class TransactionOverviewRoute extends PageRouteInfo<void> {
  const TransactionOverviewRoute({List<PageRouteInfo>? children})
      : super(
          TransactionOverviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionOverviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<DashboardRouteArgs> page =
      PageInfo<DashboardRouteArgs>(name);
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AuthorizationPasswordPage]
class AuthorizationPasswordRoute extends PageRouteInfo<void> {
  const AuthorizationPasswordRoute({List<PageRouteInfo>? children})
      : super(
          AuthorizationPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorizationPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthorizationEmailPage]
class AuthorizationEmailRoute extends PageRouteInfo<void> {
  const AuthorizationEmailRoute({List<PageRouteInfo>? children})
      : super(
          AuthorizationEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorizationEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthorizationCreatePasswordPage]
class AuthorizationCreatePasswordRoute extends PageRouteInfo<void> {
  const AuthorizationCreatePasswordRoute({List<PageRouteInfo>? children})
      : super(
          AuthorizationCreatePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorizationCreatePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
