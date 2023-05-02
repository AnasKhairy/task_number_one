import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_number_one/pages/log_out_page.dart';
import 'package:task_number_one/pages/page_one.dart';
import 'package:task_number_one/pages/page_two.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/main_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: RouteOneRoute.page),
            AutoRoute(page: RouteTwoRoute.page),
            AutoRoute(page: LogOutRoute.page)
          ],
        ),
      ];
}
