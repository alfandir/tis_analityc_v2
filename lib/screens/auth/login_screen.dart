import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tis_analytic/common/const.dart';
import 'package:tis_analytic/data/auth_services.dart';
import 'package:tis_analytic/provider/auth_provider.dart';
import 'package:tis_analytic/screens/auth/register_screen.dart';
import 'package:tis_analytic/widgets/cutom_button.dart';

import '../../widgets/text_form_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;
  Box box = Hive.box(boxUser);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalMassive,
              Image.asset('assets/img/livin.png', scale: 6),
              verticalMassive,
              TextFormFieldWidget(
                hintText: 'Username',
                controller: _usernameController,
              ),
              verticalRegular,
              TextFormFieldWidget(
                hintText: 'Password',
                controller: _passwordController,
                obscureText: _isObscured,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              verticalRegular,
              TextButton(
                child: const Text('Sign up?'),
                onPressed: () {
                  Get.to(const RegisterScreen());
                },
              ),
              verticalRegular,
              CustomButton(
                text: 'Login',
                onPressed: login,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      EasyLoading.show();
      await context.read<AuthProvider>().login(
            username: _usernameController.text,
            password: _passwordController.text,
          );
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
