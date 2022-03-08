import 'package:flutter/material.dart';
import 'package:movies_app/screens/movie_screen.dart';
import 'package:get/get.dart';
import 'package:movies_app/screens/video_screen.dart';
import 'screens/movie_detail_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MovieScreen(),

      routes: {
        '/movie': (context) => const MovieScreen(),
        '/movie-detail': (context) => const MovieDetailScreen(),
        '/video': (context) => const VideoScreen(),
      },
    );
  }
}
