class ArticleResponse {
  List<ArticleModel>? articles;
  int statusCode;
  String? message;

  ArticleResponse(this.statusCode, {Map<String, dynamic> responseData = const {}, this.message}) {
    if (statusCode == 200) {
      // article = ArticleModel.fromJson(responseData);
      articles = List.from(responseData['results']
            .map((article) => ArticleModel.fromJson(article))
            .toList());
    }
  }
}

class ArticleModel {
  int id;
  String title;
  String author;
  String? section;
  String? abstract;
  String? publishDate;
  String? thumbnail;
  String? imagePath;

  ArticleModel({
    required this.id,
    required this.title,
    required this.author,
    this.section,
    this.abstract,
    this.publishDate,
    this.thumbnail,
    this.imagePath,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> responseData) {
    dynamic thumbnail, imagePath;

    if (responseData['media'] != null && responseData['media'].isNotEmpty) {
      for (var e in responseData['media']) {
        if (e['type'] == 'image' &&
            e['media-metadata'] != null &&
            e['media-metadata'].length == 3) {
          thumbnail = e['media-metadata'][0]['url'];
          imagePath = e['media-metadata'][2]['url'];
          break;
        }
      }
    }

    return ArticleModel(
        id: responseData['id'] as int,
        title: responseData['title'] as String,
        author: responseData['byline'] as String,
        section: responseData['section'] as String,
        abstract: responseData['abstract'] as String,
        publishDate: responseData['published_date'] as String,
        thumbnail: thumbnail,
        imagePath: imagePath);
  }
}
