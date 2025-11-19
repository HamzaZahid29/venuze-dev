import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venuze_dev/core/router/app_static_routes.dart';
import 'package:venuze_dev/features/home/views/home_page.dart';
import '../../features/auth/views/login_screen.dart';
import '../services/shared_prefrences_service.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GoRouter appRoutes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  redirect: (BuildContext context, GoRouterState state) async {
    final isAuthenticated = await SharedPrefsService.isAuthenticated();
    final protectedRoutes = [AppStaticRoutes.homeScreen];
    final currentPath = state.uri.path;

    if (!isAuthenticated && protectedRoutes.contains(currentPath)) {
      return AppStaticRoutes.loginScreen;
    }

    return null;
  },
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
