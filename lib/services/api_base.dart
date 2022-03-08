import 'package:flutter/foundation.dart';

class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return "https://api.themoviedb.org/3/movie/";
    } else {
      return "https://api.themoviedb.org/3/movie/";
    }
  }
}
