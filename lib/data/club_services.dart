import 'package:dio/dio.dart';
import 'package:tis_analytic/data/api.dart';
import 'package:tis_analytic/model/club_model.dart';

class ClubServices {
  final api = ApiBaseHelper.withToken();

  Future<List<DataClub>?> getClub({String? id}) async {
    var res = await api.get('clubs');

    return ClubModel.fromJson(res)
        .data
        ?.where((e) => '${e.userId}' == id)
        .toList();
  }

  Future store({Map<String, dynamic>? map}) async {
    FormData data = FormData.fromMap(map ?? {});
    var res = await api.post('clubs', data: data);

    return res;
  }

  Future edit({Map<String, dynamic>? map, String? clubId}) async {
    FormData data = FormData.fromMap(map ?? {});
    var res = await api.put('clubs/$clubId', data: data);

    return res;
  }

  Future delete({String? clubId}) async {
    var res = await api.delete('clubs/$clubId');

    return res;
  }
}
