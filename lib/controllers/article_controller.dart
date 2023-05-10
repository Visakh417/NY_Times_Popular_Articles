import 'dart:convert';

import '../models/api_error_model.dart';
import '../models/article_model.dart';
import '../repository/api_calls.dart';
import '../repository/end_points.dart';

class ArticleController {

  /// [ArticleController] is responsible for all the Article related functionality
  
  /// [fetchPopularArticle] fetch data from NY Times Server
  /// and return a [ArticleResponse] object
  Future<ArticleResponse> fetchPopularArticle() async {
    try {

      /// Fetch the response in [responseModel]
      ResponseModel responseModel =
          await APICall().get(EndPoints.popularArticlesPath);

      /// Extracts the 'body', 'StatusCode', 'message' from [responseModel]
      /// Convert those data to an [ArticleResponse] Object
      ArticleResponse articleResponse = ArticleResponse(
          responseModel.response?.statusCode ?? 500,
          responseData: jsonDecode(responseModel.response?.body ?? ""),
          message: responseModel.response?.statusCode == 200
              ? null
              : StringConstants.somethingWentWrong);
      return articleResponse;
    } catch (e) {
      /// If any issue raise in this process, it will be considered as Internal Error
      ArticleResponse articleResponse =
          ArticleResponse(500, message: StringConstants.somethingWentWrong);
      return articleResponse;
    }
  }
}
