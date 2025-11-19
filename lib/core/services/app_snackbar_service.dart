import 'package:flutter/material.dart';
import 'package:venuze_dev/core/theme/app_theme.dart';

import '../../globals.dart';

class AppSnackbarService {
  static void showSnackbar(String text) {
    snackbarKey.currentState
      ?..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text), backgroundColor: AppThemes.primaryColor,));
  }
}
