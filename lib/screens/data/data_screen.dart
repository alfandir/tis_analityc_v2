import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tis_analytic/common/colors.dart';
import 'package:tis_analytic/data/club_services.dart';
import 'package:tis_analytic/model/club_model.dart';
import 'package:tis_analytic/provider/club_provider.dart';
import 'package:tis_analytic/widgets/custom_future_builder.dart';
import 'package:tis_analytic/widgets/cutom_button.dart';
import 'package:tis_analytic/widgets/text_form_field_widget.dart';

import '../../common/const.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  TextEditingController namaController = TextEditingController();

  Box box = Hive.box(boxUser);
  Future? init;

  Future getClub() async {
    var userId = box.get('userId');
    var prov = Provider.of<ClubProvider>(context, listen: false);
    init = prov.getClub(id: '$userId');
    return init;
  }

  @override
  void initState() {
    getClub();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Data Club'),
          elevation: 0,
          backgroundColor: primaryColor,
          actions: [
            TextButton(
              onPressed: () => _showAddBottomSheet(context),
              style: TextButton.styleFrom(
                minimumSize: Size.zero, // Set this
                padding: const EdgeInsets.all(8), // and this
              ),
              child:
                  const Text('Tambah', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
        body: Center(
          child: RefreshIndicator(
            onRefresh: () async {
              getClub().then((value) => setState(() {}));
            },
            child: CustomFutureBuilder(
              future: init,
              refreshError: () {
                getClub().then((value) => setState(() {}));
              },
              child: Consumer<ClubProvider>(
                builder: (context, club, _) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    DataClub data = club.listClub[index];
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                      // tileColor: Colors.green,
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              data.name ?? '',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 0,
                                  child: Text('edit'.toUpperCase()),
                                ),
                                PopupMenuItem(
                                  value: 1,
                                  child: Text('hapus'.toUpperCase()),
                                ),
                              ];
                            },
                            onSelected: (val) {
                              switch (val) {
                                case 0:
                                  _showAddBottomSheet(context,
                                      name: data.name, clubId: '${data.id}');
                                  break;
                                case 1:
                                  context
                                      .read<ClubProvider>()
                                      .delete(clubId: '${data.id}')
                                      .then((a) => getClub().then(
                                            (b) => setState(() {}),
                                          ));
                                  break;
                                default:
                              }
                            },
                          )
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: data.ageGroups
                                ?.map(
                                  (e) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: ListTile(
                                      tileColor: (e.name ?? '').contains('10')
                                          ? Colors.white
                                          : Colors.grey[300],
                                      dense: true,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      title: Text(e.name ?? ''),
                                    ),
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return verticalSmall;
                  },
                  itemCount: club.listClub.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddBottomSheet(BuildContext context,
      {String? name, String? clubId}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // Tutup dialog dengan mengetuk di luar dialog
      builder: (BuildContext context) {
        if (name?.isNotEmpty ?? false) {
          namaController.text = name ?? '';
        } else {
          namaController.clear();
        }
        return Dialog(
          insetPadding: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Bentuk dialog
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    (name?.isNotEmpty ?? false)
                        ? 'Edit Club'
                        : 'Tambahkan Club Baru',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSmall,
                  TextFormFieldWidget(
                    labelText: 'Nama Club',
                    controller: namaController,
                  ),
                  verticalRegular,
                  CustomButton(
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                    text: 'SIMPAN',
                    onPressed: () => (name?.isNotEmpty ?? false)
                        ? context
                            .read<ClubProvider>()
                            .edit(name: namaController.text, clubId: clubId)
                            .then((value) => Get.back())
                        : context
                            .read<ClubProvider>()
                            .store(
                              name: namaController.text,
                            )
                            .then((value) => Get.back()),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
