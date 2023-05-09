import 'package:http/http.dart' as http;

class APIErrorModel{
  String? errorMessage;
  ErrorType? errorType;
  int? statusCode;

  APIErrorModel({this.errorMessage, this.errorType, this.statusCode});
}

class ResponseModel{
  APIErrorModel? apiErrorModel;
  http.Response? response;

  ResponseModel({this.apiErrorModel, this.response});
}

enum ErrorType{
  timeOut,
  socket,
  unauthorised,
  wrongInput,
  serverError,
  exception,
}

class StringConstants{
  static const String somethingWentWrong = "Something went wrong, please try again";
  static const String serverCouldNotReached = "Server couldn't reached, please check your internet connection";
  static const String requestTimedOut = "Request timed out";
  static const String noInternet = "Server couldn't reached, please check your internet connection";
  static const String timeOutOccured = "Request timed out";
  static const String successfullyDataUpdated = "Data updated successfully";
  static const String success = "Success";
  static const String sessionExpired = "Session has expired, please login again";
}