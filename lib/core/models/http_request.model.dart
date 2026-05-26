class HttpRequestModel {
  const HttpRequestModel(
      {required this.host,
      required this.scheme,
      required this.port,
      required this.timeLimit,
      required this.timeRetry});

  final String host;
  final String scheme;
  final int port;
  final Duration timeRetry;
  final Duration timeLimit;
  final int retries = 3;

}
