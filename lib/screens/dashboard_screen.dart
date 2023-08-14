import 'package:flutter/material.dart';
import 'package:tis_analytic/common/colors.dart';
import 'package:tis_analytic/common/const.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
                    onPressed: () {},
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
              // Container(
              //   width: double.infinity,
              //   height: MediaQuery.of(context).size.height / 4,
              //   decoration: BoxDecoration(
              //     color: Colors.grey,
              //     borderRadius: BorderRadius.circular(4),
              //   ),
              // )
              // GridView.count(
              //   shrinkWrap: true,
              //   crossAxisCount: 4,
              //   mainAxisSpacing: 8,
              //   crossAxisSpacing: 16,
              //   children: [
              //     CircleAvatar(child: Icon(Icons.drafts)),
              //     CircleAvatar(child: Icon(Icons.abc)),
              //     CircleAvatar(child: Icon(Icons.abc)),
              //     CircleAvatar(child: Icon(Icons.abc)),
              //   ],
              // )
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
                    contentPadding: EdgeInsets.all(16),
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
