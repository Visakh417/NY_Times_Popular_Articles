import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ny_times_project/models/api_error_model.dart';
import 'package:ny_times_project/providers/article_provider.dart';
import 'package:ny_times_project/views/widgets/article_listing.dart';
import 'package:ny_times_project/views/widgets/custom_circular_progress.dart';
import 'package:provider/provider.dart';

import '../widgets/error_message_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    if (Provider.of<ArticleProvider>(context, listen: false).articleResponse ==
        null) {
      Provider.of<ArticleProvider>(context, listen: false).fetchArticleData();
    }
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.cyan, // status bar color
    
  ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(),
      body: Consumer<ArticleProvider>(
        builder: (context, articleProvider, child) {
          // Shows a loading widget, if the Articles is been loading
          if (articleProvider.articleResponse == null) {
            return const Center(child: CustomCircularProgress());
          }

          // List the articles
          if (articleProvider.articleResponse?.statusCode == 200) {
            return ArticleListing(
                articleProvider.articleResponse?.articles ?? []);
          }

          return ErrorMessageWidget(articleProvider.articleResponse?.message ??
              StringConstants.somethingWentWrong);
        },
      ),
    ));
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        "NY Times Most Popular",
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(color: Colors.white),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.cyan,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      actions: const [
        Icon(
          Icons.search,
          color: Colors.white,
        ),
        SizedBox(
          width: 16,
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
