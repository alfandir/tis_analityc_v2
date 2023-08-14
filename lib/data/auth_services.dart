import 'dart:convert';
import 'dart:developer';

import 'package:tis_analytic/data/api.dart';

class AuthServices {
  final api = Api.instance;

  Future login({
    String? username,
    String? password,
  }) async {
    var res = await api.post('login', data: {
      'username': username,
      'password': password,
    });
    log(jsonEncode(res));
    return res;
  }
}
