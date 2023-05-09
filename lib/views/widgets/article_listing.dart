import 'package:flutter/material.dart';
import 'package:ny_times_project/models/article_model.dart';
import 'package:ny_times_project/views/widgets/article_item.dart';

class ArticleListing extends StatelessWidget {
  final List<ArticleModel> articles;

  const ArticleListing(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      itemBuilder: (context, index) {
        return ArticleItem(article: articles[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: articles.length,
    );
  }
}
