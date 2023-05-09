import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ny_times_project/providers/article_provider.dart';
import 'package:provider/provider.dart';

import 'views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ArticleProvider>(
            create: (_) => ArticleProvider()),
      ],
      child: MaterialApp(
        title: 'NY Times Most Popular',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            iconTheme: const IconThemeData(color: Colors.white, size: 24),
            primarySwatch: Colors.cyan,
            textTheme: TextTheme(
              headline4: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              bodyText1: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400),
              bodyText2: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400),
            )),
        home: const HomeScreen(),
      ),
    );
  }
}
