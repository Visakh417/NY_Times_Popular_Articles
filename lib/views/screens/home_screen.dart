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
    /// Initiate to fetch article in  [initState]
    /// if only data is not available
    if (Provider.of<ArticleProvider>(context, listen: false).articleResponse ==
        null) {
      Provider.of<ArticleProvider>(context, listen: false).fetchArticleData();
    }

    /// Set up the Statusbar color
    /// using [SystemChrome] in [Foundation] library
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.cyan,
    
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

          /// Shows a Error message if [statusCode] is not 200 Article Fetching
          /// Set the message as [StringConstants.somethingWentWrong], if the response message is null
          return ErrorMessageWidget(articleProvider.articleResponse?.message ??
              StringConstants.somethingWentWrong);
        },
      ),
    ));
  }

  AppBar _appBar() {
    /// for readability and to reduce complexity
    /// AppBar is placed in a seperate widget
    return AppBar(
      title: Text(
        "NY Times Most Popular",
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(color: Colors.white),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        /// Status bar color
        statusBarColor: Colors.cyan,
        /// Status bar brightness (optional)
        /// For Android (dark icons)
        statusBarIconBrightness: Brightness.dark, 
        /// For iOS (dark icons)
        statusBarBrightness: Brightness.light,
      ),

      /// Placed these icons without any functionlity
      /// To make it look like in UI Design
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
