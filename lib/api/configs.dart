class AppConfigs {
  static const appBaseUrl = 'https://app-dev.kwaju.com';

  static const int timeoutDuration = 55;

  static Future<Map<String, String>> authorizedHeaders() async {
    return headers;
  }

  static final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static const String errorText = 'Oops! Something went wrong';
}
