import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:movies_app/models/movie_response.dart';
import 'package:movies_app/models/response_decoder.dart';
import 'package:movies_app/services/api_helper.dart';
import 'package:movies_app/services/api_respons.dart';
import 'package:movies_app/services/base_client.dart';
import 'package:movies_app/services/constants.dart';

class MovieController extends GetxController {
  final _moviesDecodeResponse = MoviesDecodeResponse();
  ApiResponse<List<Results>>? _movieResults;

  ApiResponse<List<Results>>? get movieResults => _movieResults;

  Future<void> fetchPopularMovies() async {
    _movieResults = ApiResponse.loading('Fetching Movies');
    update();
    try {
      final response = await BaseClient()
          .get(ApiHelper.getValue(ApiEndPoints.upcoming) + apiKey);

      if (response != null) {
        compute(_moviesDecodeResponse.processData, response).then((value) {
          _movieResults = ApiResponse.completed(value.results);
          update();
        });
      } else {
        _movieResults = ApiResponse.completed(null);
      }
      update();
    } catch (e) {
      _movieResults = ApiResponse.error(e.toString());
      update();
    }
  }

  Results findMovieById(String id) {
    return _movieResults!.data!
        .firstWhere((value) => value.id.toString() == id);
  }
}
