import 'package:dio/dio.dart';

import '../generated/l10n.dart';
import 'error_codes.dart';

String handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return CoreLocalizations().connectionTimeout;

    case DioExceptionType.sendTimeout:
      return CoreLocalizations().sendTimeout;

    case DioExceptionType.receiveTimeout:
      return CoreLocalizations().receiveTimeout;

    case DioExceptionType.badCertificate:
      return CoreLocalizations().badCertificate;

    case DioExceptionType.badResponse:
      return _extractErrorMessageFromResponse(error.response);

    case DioExceptionType.cancel:
      return CoreLocalizations().dioErrorCancel;

    case DioExceptionType.connectionError:
      return CoreLocalizations().connectionError;

    case DioExceptionType.unknown:
      return "${CoreLocalizations().unknownError} ${error.message ?? CoreLocalizations().unknown}";
  }
}

String _extractErrorMessageFromResponse(Response? response) {
  if (response == null) return CoreLocalizations().noResponse;

  try {
    final data = response.data;
    if (data is Map) {
      // Handles common formats
      if (data.containsKey('message')) {
        final msg = data['message'].toString();
        final mapped = ErrorCodes.all[msg];
        return mapped ?? msg;
      }

      if (data.containsKey('error')) return data['error'];
      if (data.containsKey('errors')) {
        // Laravel-style validation errors
        final errors = data['errors'];
        if (errors is Map && errors.isNotEmpty) {
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            return firstError.first.toString();
          }
        }
      }
    }

    if (data is String && data.isNotEmpty) {
      return data; // Plain text error response
    }

    return "${CoreLocalizations().badResponse} [${response.statusCode}].";
  } catch (e) {
    return CoreLocalizations().failedToParseResponse;
  }
}
