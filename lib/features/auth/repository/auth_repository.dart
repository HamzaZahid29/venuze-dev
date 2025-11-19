import 'dart:async';

import 'package:venuze_dev/core/network/app_api_client.dart';
import 'package:venuze_dev/core/services/shared_prefrences_service.dart';

import '../../../core/network/api_result.dart';

class AuthRepository {
  final AppApiClient _apiClient = AppApiClient();

  AuthRepository._privateConstructor();

  static final AuthRepository instance = AuthRepository._privateConstructor();

  Future<AppApiResult> login(String email, String password) async {
    final result = await _apiClient.post(
      '/auth/login',
      data: {"email": email, "password": password},
    );

    if (result is Success) {
      return Success(result.data);
    } else if (result is Failure) {
      return Failure(result.error);
    }

    return Failure("Unknown error occurred.");
  }

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await SharedPrefsService.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
