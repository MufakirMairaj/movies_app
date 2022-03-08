import 'package:http/http.dart' as http;

class HttpService {
  http.Client client = http.Client();

  factory HttpService() {
    return _instance;
  }

  HttpService._internal();

  static final HttpService _instance = HttpService._internal();
}
