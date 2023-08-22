import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tis_analytic/common/colors.dart';
import 'package:tis_analytic/model/club_model.dart';
import 'package:tis_analytic/provider/club_provider.dart';
import 'package:tis_analytic/widgets/custom_future_builder.dart';

import '../../common/const.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  Box box = Hive.box(boxUser);
  Future? init;

  Future getClub() async {
    var userId = box.get('id');
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
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: Size.zero, // Set this
                padding: EdgeInsets.all(8), // and this
              ),
              child: Text('Tambah', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
        body: Center(
          child: RefreshIndicator(
            onRefresh: () async {
              getClub();
            },
            child: CustomFutureBuilder(
              future: init,
              refreshError: () {
                getClub();
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
                            onSelected: (value) {},
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
}
