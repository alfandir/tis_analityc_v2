import 'package:flutter/material.dart';
import 'package:tis_analytic/data/auth_services.dart';
import 'package:tis_analytic/model/auth_model.dart';

class AuthProvider extends ChangeNotifier {
  final service = AuthServices();

  Future<AuthModel> login({String? username, String? password}) async {
    var res = await service.login(
      username: username,
      password: password,
    );

    return res;
  }
}
