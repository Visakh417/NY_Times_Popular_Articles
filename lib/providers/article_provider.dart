import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ny_times_project/models/api_error_model.dart';
import 'package:ny_times_project/repository/api_calls.dart';
import 'package:ny_times_project/repository/end_points.dart';

import '../models/article_model.dart';

class ArticleProvider extends ChangeNotifier {
  ArticleResponse? articleResponse;

  Future<void> fetchArticleData({bool clear = false}) async {
    if(clear){
      articleResponse = null;
      notifyListeners();
    }
    try {
      ResponseModel responseModel =
          await APICall().get(EndPoints.popularArticlesPath);
      articleResponse = ArticleResponse(
          responseModel.response?.statusCode ?? 500,
          responseData: jsonDecode(responseModel.response?.body ?? ""),
          message: responseModel.response?.statusCode == 200
              ? null
              : StringConstants.somethingWentWrong);
      notifyListeners();
    } catch (e) {
      articleResponse =
          ArticleResponse(500, message: StringConstants.somethingWentWrong);
          notifyListeners();
    }
  }
}
