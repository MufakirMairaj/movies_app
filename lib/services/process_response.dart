import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/services/api_exception.dart';

class ProcessResponse {
  static dynamic process(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 401:
      case 403:
        throw UnAuthorizedException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 408:
        throw TimeoutException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 500:
        throw InternalServerException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      default:
        throw FetchDataException(
          'Error occurred with code: ${response.statusCode}',
          response.request!.url.toString(),
        );
    }
  }
}
