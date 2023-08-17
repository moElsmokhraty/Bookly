import 'failure.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  ServerFailure({required String errMessage}) : super(errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: "Request to server was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "Connection to server failed due to internet connection");
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection timeout with server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "Receive timeout in connection with server");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "Send timeout in connection with server");
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: "Bad certificate in connection with server");
      case DioExceptionType.badResponse:
        return ServerFailure._fromResponse(dioException.response!);
      default:
        return ServerFailure(errMessage: "Oops, an unexpected error occurred, please try again later");
    }
  }

  factory ServerFailure._fromResponse(Response response) {
    final statusCode = response.statusCode!;
    final responseData = response.data!;
    String errorMessage = 'Oops, an unexpected error occurred, please try again later';

    if (responseData is Map<String, dynamic> && responseData.containsKey('error')) {
      final errorData = responseData['error'];
      if (errorData is Map<String, dynamic> && errorData.containsKey('message')) {
        errorMessage = errorData['message'];
      }
    }

    switch (statusCode) {
      case 404:
        errorMessage = 'Your request was not found, please try again later';
        break;
      case 500:
        errorMessage = 'Internal server error, please try again later';
        break;
      case 400:
      case 401:
      case 402:
      case 403:
        errorMessage = errorMessage.isNotEmpty ? errorMessage : "An error occurred while processing your request";
        break;
      default:
        break;
    }

    return ServerFailure(errMessage: errorMessage);
  }
}
