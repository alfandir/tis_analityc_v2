import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tis_analytic/common/const.dart';
import 'package:tis_analytic/data/config.dart';

class Api {
  final Dio dio = Dio();

  Api._() {
    dio.options.baseUrl = Apis.baseUrl;

    final token = Hive.box(boxUser).get('token', defaultValue: '');
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  static final Api instance = Api._();

  Future<dynamic> handleResponse(Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      log(jsonEncode(response.data['data']));
      return response.data['data'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      debugPrint(path);
      final response = await dio.get(path, queryParameters: queryParameters);

      return handleResponse(response);
    } on DioException catch (e) {
      String? errorMessage = e.response?.statusMessage.toString();
      log('$errorMessage', error: e);
    } catch (e) {
      log('failed to call API', error: e);
      return null;
    }
  }

  Future post(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      log(path);
      final response = await dio.post(path, data: data);

      return handleResponse(response);
    } on DioException catch (e) {
      String? errorMessage = e.response?.statusMessage.toString();
      log('$errorMessage', error: e);
    } catch (e) {
      log('failed to call API', error: e);
      return null;
    }
  }

  Future put(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      log(path);
      final response = await dio.put(
        path,
        data: data,
      );
      return handleResponse(response);
    } on DioException catch (e) {
      String? errorMessage = e.response?.statusMessage.toString();
      log('$errorMessage', error: e);
    } catch (e) {
      log('failed to call API', error: e);
      return null;
    }
  }

  Future delete(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      log(path);
      final response = await dio.delete(
        path,
        data: data,
      );
      return handleResponse(response);
    } on DioException catch (e) {
      String? errorMessage = e.response?.statusMessage.toString();
      log('$errorMessage', error: e);
    } catch (e) {
      log('failed to call API', error: e);
      return null;
    }
  }

  Future download(String path, String savePath) async {
    try {
      final response = await dio.download(path, savePath);
      return response;
    } on DioException catch (e) {
      String? errorMessage = e.response?.statusMessage.toString();
      log('$errorMessage', error: e);
    } catch (e) {
      log('failed to call API', error: e);
      return null;
    }
  }
}
