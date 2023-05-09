
class EndPoints {
  static const baseURL = 'https://api.nytimes.com';

  static const String section = 'all-sections';

  static const String apiKey = 'p4eUnr7ZzjEO00sqDzp2dGN9hwJVp7HD';

  static const String period = '7';
  static const String popularArticlesPath =
      '/svc/mostpopular/v2/mostviewed/$section/$period.json?api-key=$apiKey';
}
