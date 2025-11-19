import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venuze_dev/core/router/app_static_routes.dart';
import 'package:venuze_dev/features/home/views/home_page.dart';
import '../../features/auth/views/login_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GoRouter appRoutes = GoRouter(
  navigatorKey: _rootNavigatorKey,

  routes: [
    GoRoute(
      path: AppStaticRoutes.loginScreen,
      name: AppStaticRoutes.loginScreen,
      pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
    ),
    GoRoute(
      path: AppStaticRoutes.homeScreen,
      name: AppStaticRoutes.homeScreen,
      pageBuilder: (context, state) => MaterialPage(child: HomePage()),
    ),
  ],
);
