import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
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

    listClub = res ?? [];
    notifyListeners();
    return res;
  }

  Future<void> store({String? name}) async {
    final service = ClubServices();
    try {
      EasyLoading.show();
      var res = await service.store(
        map: {
          'name': name,
          'user_id': box.get('userId'),
        },
      );
      if (res['status'] == "success") {
        EasyLoading.showSuccess('Berhasil Menambah Club');
      }
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> edit({String? name, String? clubId}) async {
    final service = ClubServices();
    try {
      EasyLoading.show();
      var res = await service.edit(
        map: {
          'name': name,
        },
        clubId: clubId,
      );
      if (res['status'] == "success") {
        EasyLoading.showSuccess('Berhasil Mengubah Club');
      }
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> delete({String? clubId}) async {
    final service = ClubServices();
    try {
      EasyLoading.show();
      var res = await service.delete(clubId: clubId);
      if (res['status'] == "success") {
        EasyLoading.showSuccess('Berhasil Hapus Club');
      }
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
