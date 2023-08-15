import 'package:tis_analytic/data/api.dart';
import 'package:tis_analytic/model/auth_model.dart';

class AuthServices {
  final api = ApiBaseHelper.noToken();

  Future<AuthModel> login({
    String? username,
    String? password,
  }) async {
    var res = await api.post('login', data: {
      'email': username,
      'password': password,
    });
    return AuthModel.fromJson(res);
  }
}
