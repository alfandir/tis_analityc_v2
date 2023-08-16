import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tis_analytic/common/const.dart';
import 'package:tis_analytic/data/auth_services.dart';
import 'package:tis_analytic/model/auth_model.dart';

class AuthProvider extends ChangeNotifier {
  final service = AuthServices();
  Box box = Hive.box(boxUser);

  Future<AuthModel> login({String? username, String? password}) async {
    var res = await service.login(
      username: username,
      password: password,
    );

    if (res.status == 'success') {
      box.put('isLogin', true);
      box.put('name', res.data?.name);
      box.put('email', res.data?.email);
      box.put('token', res.data?.apiToken);
      box.put('role', res.data?.role);
      box.put('birth_place', res.data?.birthPlace);
      box.put('birth_date', res.data?.birthDate);
    }

    return res;
  }
}
