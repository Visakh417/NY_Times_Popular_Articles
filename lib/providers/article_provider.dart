import 'package:flutter/material.dart';
import 'package:ny_times_project/controllers/article_controller.dart';


import '../models/article_model.dart';

class ArticleProvider extends ChangeNotifier {
  ArticleResponse? articleResponse;


  /// Fetch news article
  /// if [clear] is true, the value in [articleResponse] will be assigned as null
  Future<void> fetchArticleData({bool clear = false}) async {
    if(clear){
      articleResponse = null;
      notifyListeners();
    }
    /// Any situation, [ArticleController] will provide a non-nullable value
    articleResponse = await ArticleController().fetchPopularArticle();
    notifyListeners();
  }
}
