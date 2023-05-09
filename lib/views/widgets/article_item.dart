import 'package:flutter/material.dart';
import 'package:ny_times_project/views/screens/article_detail.dart';

import '../../models/article_model.dart';
import '../../values/constants.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({required this.article, Key? key}) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleDetail(
              article: article,
            ),
          ),
        );
      },
      child: SizedBox(
        height: screenHeight * 0.12,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(article.thumbnail ?? Constants.defaultThumbnail),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          article.author,
                          style: Theme.of(context).textTheme.bodyText2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                article.section ?? '',
                                style: Theme.of(context).textTheme.bodyText2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                                child: Row(
                              children: [
                                const Icon(
                                  Icons.today,
                                  size: 20,
                                  color: Colors.black54,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(article.publishDate ?? '',
                                    style: Theme.of(context).textTheme.bodyText2),
                              ],
                            ))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),

              const Icon(Icons.navigate_next, color: Colors.black54)
            ],
          ),
        ),
      ),
    );
  }
}
