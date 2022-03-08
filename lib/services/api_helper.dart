enum ApiEndPoints { upcoming, popular }

class ApiHelper {
  static String getValue(ApiEndPoints path) {
    switch (path) {
      case ApiEndPoints.upcoming:
        return "upcoming";
      case ApiEndPoints.popular:
        return "popular";
    }
  }
}
