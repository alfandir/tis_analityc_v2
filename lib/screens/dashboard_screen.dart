import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tis_analytic/common/colors.dart';
import 'package:tis_analytic/common/const.dart';
import 'package:tis_analytic/screens/auth/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Box box = Hive.box(boxUser);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Selamat Datang,',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.blue[900]),
                      children: const [
                        TextSpan(
                          text: '\nAlfandi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      box.clear();

                      Get.offAll(const LoginScreen());
                    },
                    icon: Icon(Icons.logout, color: primaryColor),
                    label: Text(
                      'Keluar',
                      style: TextStyle(color: primaryColor),
                    ),
                  )
                ],
              ),
              verticalRegular,
              Image.asset(
                'assets/img/banner.jpg',
                scale: 1,
                fit: BoxFit.contain,
              ),
              verticalRegular,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
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
                    title: Text(
                      'Kelas ${index + 1}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSmall,
                        ListTile(
                          tileColor: Colors.grey[200],
                          dense: true,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          title: Text('data'),
                        ),
                        verticalSmall,
                        ListTile(
                          tileColor: Colors.grey[200],
                          dense: true,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          title: Text('data'),
                        ),
                        verticalSmall,
                        ListTile(
                          tileColor: Colors.grey[200],
                          dense: true,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          title: Text('data'),
                        ),
                        verticalSmall,
                        ListTile(
                          tileColor: Colors.grey[200],
                          dense: true,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          title: Text('data'),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return verticalSmall;
                },
                itemCount: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
