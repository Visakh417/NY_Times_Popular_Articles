import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../models/api_error_model.dart';
import 'package:http/http.dart' as http;

import 'end_points.dart';


class APICall {
  Future<ResponseModel> get(String url, {Map<String, String> header  = const {}}) async {
    ResponseModel responseResult;
    try {
      http.Response response = await http
          .get(Uri.parse(EndPoints.baseURL + url), headers: header)
          .timeout(const Duration(seconds: 10));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        responseResult = ResponseModel(response: response);
      } else {
        if (response.statusCode == 401) {
          responseResult = ResponseModel(
              apiErrorModel: APIErrorModel(
            errorMessage: StringConstants.sessionExpired,
            errorType: ErrorType.unauthorised,
            statusCode: response.statusCode,
          ));
        } else {
          responseResult = ResponseModel(
              apiErrorModel: APIErrorModel(
            errorMessage: jsonDecode(response.body)['message'],
            errorType: ErrorType.wrongInput,
            statusCode: response.statusCode,
          ));
        }
      }
    } on SocketException {
      responseResult = ResponseModel(
          apiErrorModel: APIErrorModel(
        errorMessage: StringConstants.noInternet,
        errorType: ErrorType.socket,
        statusCode: -1,
      ));
    } on TimeoutException {
      responseResult = ResponseModel(
          apiErrorModel: APIErrorModel(
        errorMessage: StringConstants.timeOutOccured,
        errorType: ErrorType.timeOut,
        statusCode: -1,
      ));
    } catch (e) {
      responseResult = ResponseModel(
          apiErrorModel: APIErrorModel(
        errorMessage: StringConstants.somethingWentWrong,
        errorType: ErrorType.exception,
        statusCode: -1,
      ));
    }
    return responseResult;
  }
  
}