import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venuze_dev/core/router/app_static_routes.dart';
import 'package:venuze_dev/core/services/shared_prefrences_service.dart';
import 'package:venuze_dev/core/widgets/app_elevated_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User logged in successfully'),
            AppElevatedButton(
              onTap: () async {
                await SharedPrefsService.clearTokens();
                context.goNamed(AppStaticRoutes.loginScreen);
              },
              label: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}
