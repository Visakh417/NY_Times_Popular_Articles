import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ny_times_project/models/article_model.dart';

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({required this.article, Key? key}) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title:  Text(article.title, maxLines: 1,style: Theme.of(context).textTheme.headline4?.copyWith(
          color: Colors.white
        ),),
        systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.cyan,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              article.title,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          article.imagePath != null
              ? Image(image: NetworkImage(article.imagePath!))
              : Container(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(article.abstract ?? '', style: Theme.of(context).textTheme.bodyText1),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenSize.width * 0.5,
                  child: Text(
                    article.author,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.today,
                      size: 20,
                      color: Colors.black54,
                    ),
                    Text(
                      article.publishDate ?? '',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
