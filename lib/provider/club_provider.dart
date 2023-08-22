import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tis_analytic/common/const.dart';
import 'package:tis_analytic/data/club_services.dart';
import 'package:tis_analytic/model/club_model.dart';

class ClubProvider extends ChangeNotifier {
  final service = ClubServices();
  Box box = Hive.box(boxUser);

  List<DataClub> listClub = [];

  Future<List<DataClub>?> getClub({String? id}) async {
    var res = await service.getClub(id: id);

    if (res?.isNotEmpty ?? false) {
      listClub = res ?? [];
    }
    notifyListeners();
    return res;
  }
}
