import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:venuze_dev/core/network/api_result.dart';
import 'package:venuze_dev/core/router/app_static_routes.dart';
import 'package:venuze_dev/features/auth/models/login_response_model.dart';

import '../repository/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository.instance;

  bool _isLoading = false;
  bool _isCaptchaChecked = false;
  String? _errorMessage;
  LoginResponseModel? _userData;

  bool get isLoading => _isLoading;

  bool get isCaptchaChecked => _isCaptchaChecked;

  String? get errorMessage => _errorMessage;

  dynamic get userData => _userData;

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    _setLoading(true);
    _errorMessage = null;
    notifyListeners();

    final result = await _authRepository.login(email, password);

    if (result is Success) {
      _userData = LoginResponseModel.fromJson(result.data);
      final tokens = _userData?.data?.tokens;
      if (tokens != null) {
        await _authRepository.saveTokens(tokens.accessToken ?? '', tokens.refreshToken ?? '');
        context.goNamed(AppStaticRoutes.homeScreen);
      }
    } else if (result is Failure) {
      _errorMessage = result.error;
    }

    _setLoading(false);
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
  }

  void _setCaptcha(bool value) {
    _isCaptchaChecked = value;
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
