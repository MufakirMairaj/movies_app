import 'dart:async';
import 'dart:io';

import 'package:movies_app/services/api_exception.dart';
import 'package:movies_app/services/constants.dart';
import 'package:movies_app/services/process_response.dart';

import 'api_base.dart';

class BaseClient {
  Future<dynamic> get(String url) async {
    final uri = Uri.parse(APIBase.baseURL + url);
    try {
      final response = await client
          .get(uri)
          .timeout(const Duration(seconds: timeOutDuration));

      return ProcessResponse.process(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api Not Responding in time", uri.toString());
    }
  }
}
