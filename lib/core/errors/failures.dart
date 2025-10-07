import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.FromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout');
      case DioExceptionType.badCertificate:
        throw UnimplementedError();
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode ?? 0,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to API server was canceled');
      case DioExceptionType.connectionError:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        return ServerFailure(
          errMessage: 'Unexpected Error, Please Try again !',
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          errMessage: 'Unkown error !\n Try Restarting ur life :)',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 401) {
      return ServerFailure(errMessage: response['error']['messsage']);
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: 'method not found, try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: 'internal server error, try again later',
      );
    } else {
      return ServerFailure(
        errMessage: 'opps there was an error, please try again later !',
      );
    }
  }
}
