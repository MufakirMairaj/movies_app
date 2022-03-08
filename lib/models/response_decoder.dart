import 'dart:convert';

import 'movie_response.dart';

mixin ResponseDecode {
  dynamic processData(String encodedJson) {}
}

class MoviesDecodeResponse implements ResponseDecode {
  @override
  MoviesResponse processData(dynamic encodedJson) {
    var movies = jsonDecode(encodedJson);
    var responseData = MoviesResponse.fromJson(movies);
    return responseData;
  }
}
