class AppException implements Exception {
  final String message;
  final String prefix;
  final String url;

  AppException(this.message, this.prefix, this.url);
}

class BadRequestException extends AppException {
  BadRequestException(String message, String url)
      : super(message, 'Bad Request', url);
}

class FetchDataException extends AppException {
  FetchDataException(String message, String url)
      : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException(String message, String url)
      : super(message, 'Api not responding exception ', url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(String message, String url)
      : super(message, 'UnAuthorized  Request', url);
}

class InternalServerException extends AppException {
  InternalServerException(String message, String url)
      : super(message, 'Internal Server Error', url);
}


class TimeoutException extends AppException {
  TimeoutException(String message, String url)
      : super(message, 'Oops! It took longer to respond', url);
}
