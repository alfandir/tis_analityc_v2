import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:tis_analytic/common/const.dart';
import 'package:tis_analytic/data/config.dart';

class ApiBaseHelper {
  ApiBaseHelper() : dio = createDio();

  ApiBaseHelper.withToken() : dio = createDioWithToken();

  ApiBaseHelper.noToken() : dio = createDioNoToken();

  static const String _baseUrl = Apis.baseUrl;

  String get baseUrl => _baseUrl;

  /// custom to log everytime (true) or only when error found (false)
  // bool isLog = true;
  bool isLog = true;

  /// helper to change map to params
  String mapToParams(Map<String, dynamic>? map, {bool useAnd = false}) {
    return (useAnd ? '&' : '?') + Uri(queryParameters: map).query;
  }

  final Dio dio;

  static BaseOptions opts = BaseOptions(
    baseUrl: Apis.baseUrl,
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    followRedirects: false,
  );

  static Dio createDioWithToken() {
    return Dio(opts)
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          // place token here
          var box = Hive.box(boxUser);
          var token = box.get('token');
          options.headers.addAll({"Authorization": "Bearer $token"});
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onError: (DioException e, handler) {
          // Do something with response error
          return handler.next(e); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        },
      ));
  }

  static Dio createDioNoToken() {
    return Dio(opts)
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Do something with response data

          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onError: (DioException e, handler) {
          // Do something with response error
          return handler.next(e); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        },
      ));
  }

  static Dio createDio() {
    return Dio(opts);
  }

/*
[buildParameters] digunakan untuk handle parameter null
how to use
    example:
        String outletUserParam = ApiBaseHelper.buildParameters({
      'outlet_id': outletId,
      'limit': limit,
      'offset': offset,
      'search': search,
    });
    final String url = '/merchant-api/outlet/get-user?$outletUserParam';
 */
  static String buildParameters(Map map) {
    List<String> params = [];
    map.forEach((key, value) {
      if (value != null) {
        params.add('$key=$value');
      }
    });
    return params.join('&');
  }

  Future<dynamic> get(String url,
      {Map<String, dynamic>? header,
      Options? options,
      Map<String, dynamic>? queryParameters}) async {
    try {
      if (isLog) {
        log('$url, header: $header}');
      }
      Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options ??
            Options(
              headers: header,
            ),
      );
      checkError(response, url: url, header: header);
      if (isLog) {
        log(jsonEncode(response.data));
      }
      return response.data;
    } on DioException catch (dioError) {
      dioErrorHandling(dioError, url: url, header: header);
    } catch (e) {
      if (!isLog) {
        log('$url, header: $header}');
      }
      log('Non dio error', error: e);
      throw e.toString();
    }
  }

  Future<dynamic> post(String url,
      {dynamic data, Map<String, dynamic>? header, Options? options}) async {
    try {
      if (isLog) {
        log('$url, header: $header, body $data}');
      }
      Response response = await dio.post(
        url,
        data: data,
        options: options ??
            Options(
              headers: header,
            ),
      );

      checkError(response, url: url, header: header, body: data);
      if (isLog) {
        log(jsonEncode(response.data));
      }
      return response.data;
    } on DioException catch (dioError) {
      dioErrorHandling(dioError, url: url, header: header, data: data);
    } catch (e) {
      if (!isLog) {
        log('$url, header: $header, body: $data');
      }
      log('Non dio error', error: e);
      throw e.toString();
    }
  }

  Future<dynamic> put(String url,
      {dynamic data, Map<String, dynamic>? header, Options? options}) async {
    try {
      if (isLog) {
        log('$url, header: $header}');
      }
      Response response = await dio.put(
        url,
        data: data,
        options: options ??
            Options(
              headers: header,
            ),
      );
      checkError(response, url: url, header: header, body: data);
      if (isLog) {
        log(jsonEncode(response.data));
      }
      return response.data;
    } on DioException catch (dioError) {
      dioErrorHandling(dioError, url: url, header: header, data: data);
    } catch (e) {
      if (!isLog) {
        log('$url, header: $header, body: $data');
      }
      log('Non dio error', error: e);
      throw e.toString();
    }
  }

  Future<dynamic> delete(String url,
      {dynamic data, Map<String, dynamic>? header, Options? options}) async {
    try {
      if (isLog) {
        log('$url, header: $header, body $data}');
      }
      Response response = await dio.delete(
        url,
        data: data,
        options: options ??
            Options(
              headers: header,
            ),
      );
      checkError(response, url: url, header: header, body: data);
      if (isLog) {
        log(jsonEncode(response.data));
      }
      return response.data;
    } on DioException catch (dioError) {
      dioErrorHandling(dioError, url: url, header: header, data: data);
    } catch (e) {
      if (!isLog) {
        log('$url, header: $header, body: $data');
      }

      throw e.toString();
    }
  }

  checkError(Response response, {dynamic url, dynamic header, dynamic body}) {
    if (response.data == null) throw 'Gagal';
    if (response.data['status'] == 'failed') {
      log(jsonEncode(response.data));
      throw response.data['message'] ??
          response.data['data']?['message'] ??
          'Failed';
    }
  }

  dioErrorHandling(
    DioException dioError, {
    dynamic url,
    dynamic header,
    dynamic data,
  }) {
    if (!isLog) {
      log(jsonEncode(data));
    }
    var statusCode = dioError.response?.statusCode;
    if (statusCode == 302) throw 'Terjadi kesalahan!';
    if (dioError.response?.data['message'] is List) {
      throw '${dioError.response?.data['message']?[0]?['messages']?[0]?['message']}';
    }

    if (dioError.response?.data['statusCode'] != null) {
      throw '${dioError.response?.data['statusCode']} : ${dioError.response?.data['message']}';
    } else {
      var msg = '${dioError.response}';
      if (dioError.message == 'XMLHttpRequest error.') {
        msg = 'Server Maintenance';
      }
      throw '${statusCode ?? 500} : $msg';
    }
  }

  nonDioErrorHandling({
    dynamic e,
    dynamic trace,
    dynamic url,
    dynamic header,
    dynamic data,
  }) {
    if (!isLog) {
      // logInput(url, header: header, body: data);
      log(jsonEncode(data));
    }
    log('Non dio error', error: e);
    throw e.toString();
  }
}
