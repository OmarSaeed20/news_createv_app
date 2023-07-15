// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

class DioExceptions implements Exception {
  static late String message;
  static int statusCode = -1;

  DioExceptions.fromDioError(
      {required DioException dioException, required String? errorFrom}) {
    //This will print error is Json format and colorful
    _prettyPrintError(dioError: dioException, errorFrom: errorFrom);
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      /* case DioExceptionType.response:
        message = _handleError(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
        statusCode = dioException.response?.statusCode ?? -1;
        break; */
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  String errorMessage() => message;

  int errorStatusCode() => statusCode;

  void _prettyPrintError(
      {required DioException dioError, required String? errorFrom}) {
    debugPrint(
        '\x1B[31m${"********************************************************"}\x1B[0m');
    debugPrint('\x1B[31m${"🚨 ERROR exception from: $errorFrom"}\x1B[0m');
    debugPrint(
        '\x1B[31m${"🚨 ERROR it's status Code : ${dioError.response?.statusCode ?? -1}"}\x1B[0m');
    try {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyprint = encoder.convert(dioError.response?.data ?? '');
      debugPrint(
          '\x1B[31m${"********************************************************"}\x1B[0m');
      log("🕵️$errorFrom Error Response :\n$prettyprint", name: "Error");
      debugPrint(
          '\x1B[31m🕵️$errorFrom Error Response :\n$prettyprint", name: "Error"\x1B[0m');
      debugPrint(
          '\x1B[31m${"********************************************************"}\x1B[0m');
    } catch (e) {
      log("🕵️ $errorFrom Error Response :\n${dioError.response?.data ?? ''}",
          name: "Error");
      debugPrint(
          '\x1B[31m${"********************************************************"}\x1B[0m');
    }
  }
}
/* 33333333333333333333333333333333
Future<T> handleDioExceptions<T>(Future<T> Function() future) async {
  try {
    return await future();
  } on DioException catch (e) {
    throw DataFailed(DioException(
      error: e.response?.statusMessage,
      response: e.response,
      type: e.type,
      requestOptions: e.requestOptions,
    ));
  }
} */


/* 22222222222
class DioExceptionHandler {
  static DataFailed handleException(dynamic e) {
    if (e is DioException) {
      DioException dioError = e;
      String error;
      DioResponse response;
      DioExceptionType type;
      RequestOptions requestOptions;

      if (dioError.type == DioExceptionType.response) {
        error = dioError.response?.statusMessage;
        response = dioError.response;
        type = DioExceptionType.response;
        requestOptions = dioError.requestOptions;
      } else {
        error = _getErrorFromDioExceptionType(dioError.type);
        type = _getDioExceptionTypeFromDioErrorType(dioError.type);
        requestOptions = dioError.requestOptions;
      }

      return DataFailed(DioException(
        error: error,
        response: response,
        type: type,
        requestOptions: requestOptions,
      ));
    } else {
      return DataFailed(DioException(
        error: "An error occurred. Please try again later.",
        type: DioExceptionType.other,
      ));
    }
  }

  static String _getErrorFromDioExceptionType(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.cancel:
        return "Request was cancelled";
      case DioExceptionType.connectTimeout:
        return "Connection timeout. Please check your internet connection.";
      case DioExceptionType.sendTimeout:
        return "Request timeout. Please try again.";
      case DioExceptionType.receiveTimeout:
        return "Server is not responding. Please try again later.";
      default:
        return "An error occurred. Please try again later.";
    }
  }

  static DioExceptionType _getDioExceptionTypeFromDioErrorType(
      DioExceptionType type) {
    switch (type) {
      case DioExceptionType.cancel:
        return DioExceptionType.cancel;
      case DioExceptionType.connectTimeout:
        return DioExceptionType.connectTimeout;
      case DioExceptionType.sendTimeout:
        return DioExceptionType.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return DioExceptionType.receiveTimeout;
      default:
        return DioExceptionType.other;
    }
  }
} */
/* 111111111111111111111
class ErrorHandler implements Exception {
  late DataState data;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      data = _handleError(error);
    } else {
      // default error
      data = DataSource.DEFAULT.getFailure();
    }
  }
}

DataState _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return DataFailed(error);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    // case DioExceptionType.unknown:
    //   return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.BAD_REQUEST.getFailure();

    case DioExceptionType.badResponse:
      return DataSource.BAD_REQUEST.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.CONNECT_TIMEOUT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  DataState getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return const DataSuccess(ResponseCode.SUCCESS);
      case DataSource.NO_CONTENT:
        return const DataSuccess(ResponseCode.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return const DataSuccess(ResponseCode.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return const DataSuccess(ResponseCode.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return const DataSuccess(ResponseCode.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return const DataSuccess(ResponseCode.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return const DataSuccess(ResponseCode.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return const DataSuccess(ResponseCode.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return const DataSuccess(ResponseCode.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return const DataSuccess(ResponseCode.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return const DataSuccess(ResponseCode.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return const DataSuccess(ResponseCode.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return const DataSuccess(ResponseCode.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return const DataSuccess(ResponseCode.DEFAULT);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = "success"; // success with data
  static const String NO_CONTENT =
      "not success"; // success with no data (no content)
  static const String BAD_REQUEST =
      "badRequestError"; // failure, API rejected request
  static const String UNAUTORISED =
      'unauthorizedError'; // failure, user is not authorised
  static const String FORBIDDEN =
      'forbiddenError'; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      "internalServerError"; // failure, crash in server side
  static const String NOT_FOUND =
      "notFoundError"; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = 'timeoutError';
  static const String CANCEL = 'defaultError';
  static const String RECIEVE_TIMEOUT = 'timeoutError';
  static const String SEND_TIMEOUT = 'timeoutError';
  static const String CACHE_ERROR = 'cacheError';
  static const String NO_INTERNET_CONNECTION = 'noInternetError';
  static const String DEFAULT = 'defaultError';
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
 */