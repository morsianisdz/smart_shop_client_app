import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as navigate;
import 'package:smart_shop_client_app/config/http.conf.dart';
import 'package:smart_shop_client_app/constants/local_storage_keys.dart';
import 'package:smart_shop_client_app/core/models/http_request.model.dart';
import 'package:smart_shop_client_app/core/services/localStorage.service.dart';
import 'package:smart_shop_client_app/features/auth/screens/login.screen.dart';

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

  String _handleErrors(DioException e) {
    if (e.response == null) {
      return 'Error sending request';
    }
    switch (e.response!.statusCode) {
      case 500:
        return e.response!.data;
      case 401 || 403:
        navigate.Get.offAll(() => const LoginScreen());
        return 'unauthorized';
      default:
        return 'Error sending request';
    }
  }

  Future<dynamic> get(String function,
      {bool withbearer = true,
      Map<String, dynamic> params = const {},
      HttpRequestModel httpRequestConf = HttpConf.marketHost}) async {
    _configureDio(httpRequestConf);
    if (withbearer) {
      String? token = await LocalStorageService().shpReadString(LS.jwt);

      //token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzg3NjU1NTk5LCJleHAiOjE3ODc2NTkxOTksIm5iZiI6MTc4NzY1NTU5OSwianRpIjoiWUd4dGtrbWNTRWRpbFFYaCIsInN1YiI6IjciLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.5lPD5ghG6UqSYNIuCBlz-XQf9MZW94nGzCY-sBNpmAk";
      if (token != null) {
        dio.options.headers.addAll({'Authorization': 'Bearer $token'});
      }
    }
    
    try {
      final response = await dio.get('/api/$function', queryParameters: params);

      if ((response.data is List) && response.data['errors'] != null) {
        throw response.data['errors'];
      }

      return response.data;
    } on DioException catch (e) {
      print(dio.options.baseUrl);
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
      print('MESSAGE: ${e.message}');
      throw _handleErrors(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String function, Map<String, dynamic> data,
      {bool withbearer = true,
      Map<String, dynamic> params = const {},
      HttpRequestModel httpRequestConf = HttpConf.marketHost}) async {
    _configureDio(httpRequestConf);

    if (withbearer) {
      String? token = await LocalStorageService().shpReadString(LS.jwt);
      if (token != null) {
        dio.options.headers.addAll({'Authorization': 'Bearer $token'});
      }
    }
    
    try {
      final response =
          await dio.post('/api/$function', queryParameters: params, data: data);

      if ((response.data is List) && response.data['errors'] != null) {
        throw response.data['errors'];
      }
      return response.data;
    } on DioException catch (e) {
      print(dio.options.baseUrl);
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
      print('MESSAGE: ${e.message}');
      throw _handleErrors(e);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> multipartPost(String function, Map file,
      {Map<String, dynamic> data = const {},
      bool withbearer = true,
      Map<String, dynamic> params = const {},
      HttpRequestModel httpRequestConf = HttpConf.marketHost}) async {
    _configureDio(httpRequestConf);
    dio.options.headers = <String, String>{
      'Content-Type': 'multipart/form-data',
    };
    if (withbearer) {
      String? token = await LocalStorageService().shpReadString(LS.jwt);
      if (token != null) {
        dio.options.headers.addAll(
            {'Authorization': 'Bearer $token', 'Accept': 'application/json'});
      }
    }
    Map<String, dynamic> formDataMAp = {
      'file':
          MultipartFile.fromFileSync(file['data'].path, filename: file['name'])
    };

    formDataMAp.addAll(data);
    final formData = FormData.fromMap(formDataMAp);

    try {
      final response = await dio.post('/api/$function',
          queryParameters: params, data: formData);

      if (response.data['errors'] != null) {
        throw response.data['errors'];
      }
      return response.data;
    } on DioException catch (e) {
      throw _handleErrors(e);
    } catch (e) {
      rethrow;
    }
  }

  /* Uri _getUri(HttpRequestModel marketHost) {
    return Uri(scheme: marketHost.scheme, host: marketHost.scheme, port: marketHost.port);
  } */
}
