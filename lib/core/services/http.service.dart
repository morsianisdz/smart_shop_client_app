import 'dart:async';
import 'package:dio/dio.dart';
import 'package:smart_shop_client_app/config/http.conf.dart';
import 'package:smart_shop_client_app/constants/appText.data.dart';
import 'package:smart_shop_client_app/core/models/http_request.model.dart';
import 'package:get/get.dart';

class HttpService {
  final dio = Dio();

  final Map<String, String> _headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json'
  };

  void _configureDio(HttpRequestModel requestConf) {
    dio.options.baseUrl = Uri(
      scheme: requestConf.scheme,
      host: requestConf.host,
      port: requestConf.port,
    ).toString();
    dio.options.headers = _headers;
    dio.options.connectTimeout = requestConf.timeLimit;
    dio.options.receiveTimeout = requestConf.timeLimit;
  }

  Future<dynamic> get(String function,
      {Map<String, dynamic> params = const {},
      HttpRequestModel httpRequestConf = HttpConf.marketHost}) async {
    _configureDio(httpRequestConf);

    try {
      final response = await dio.get('/api/$function', queryParameters: params);

      if (response.data is! List && response.data['errors'] != null) {
        throw response.data['errors'];
      }

      return response.data;
    } on DioException catch (_) {
      throw AppText.httpError.tr;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String function, Map<String, dynamic> data,
      {Map<String, dynamic> params = const {},
      HttpRequestModel httpRequestConf = HttpConf.marketHost}) async {
    _configureDio(httpRequestConf);

    try {
      final response =
          await dio.post('/api/$function', queryParameters: params, data: data);

      if (response.data['errors'] != null) {
        throw response.data['errors'];
      }
      return response.data;
    } on DioException catch (_) {
      throw AppText.httpError.tr;
    } catch (e) {
      rethrow;
    }
  }
}
