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
}
