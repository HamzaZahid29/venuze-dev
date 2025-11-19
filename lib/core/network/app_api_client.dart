import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:venuze_dev/core/constants/app_constants.dart';
import 'package:venuze_dev/core/network/api_result.dart';

class AppApiClient {
  final Dio _dio;

  AppApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: AppConstants.apiBaseUrl,
          connectTimeout: Duration(seconds: 40),
          receiveTimeout: Duration(seconds: 50),
        ),
      ) {
    _dio.interceptors.add(PrettyDioLogger());
  }

  AppApiResult<dynamic> _handleError(DioException error) {
    String message;

    if (error.response != null) {
      final data = error.response?.data;

      if (data is Map<String, dynamic>) {
        if (data.containsKey('success') && data['success'] == false) {
          message = data['message'] ?? "An error occurred";
        } else if (data.containsKey('message')) {
          message = data['message'];
        } else {
          message = "An unknown server error occurred.";
        }
      } else if (data is String) {
        message = data;
      } else {
        message = "An unknown server error occurred.";
      }
    }
    // Handle network/timeout errors
    else if (error.type == DioExceptionType.connectionTimeout) {
      message = "Connection Timeout. Please try again.";
    } else if (error.type == DioExceptionType.receiveTimeout) {
      message = "Receive Timeout. Please try again.";
    } else if (error.type == DioExceptionType.badResponse) {
      message = "Bad Response. Something went wrong.";
    } else if (error.type == DioExceptionType.cancel) {
      message = "Request was cancelled.";
    } else if (error.type == DioExceptionType.unknown) {
      message = "No internet connection. Please check your network.";
    } else {
      message = "Unexpected error. Please try again.";
    }

    return Failure(message);
  }

  Future<AppApiResult<dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
      );
      return Success(response.data);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<AppApiResult<dynamic>> post(
      String endpoint, {
        Map<String, dynamic>? data,
        bool isFormData = false,
      }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: isFormData
            ? Options(contentType: Headers.formUrlEncodedContentType)
            : null,
      );

      if (response.data is Map<String, dynamic> &&
          response.data['success'] == false) {
        return Failure(response.data['message'] ?? "Request failed");
      }

      return Success(response.data);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }
}
