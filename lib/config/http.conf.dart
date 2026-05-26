import 'package:smart_shop_client_app/core/models/http_request.model.dart';

class HttpConf {
  static const HttpRequestModel marketHost = HttpRequestModel(
      host: "192.168.8.102",
      scheme: "http",
      port: 8000,
      timeLimit: Duration(seconds: 3),
      timeRetry: Duration(seconds: 10));
}
