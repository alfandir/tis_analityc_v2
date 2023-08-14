import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tis_analytic/common/const.dart';
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalMassive,
            Image.asset('assets/img/livin.png', scale: 6),
            verticalMassive,
            const TextFormFieldWidget(
              hintText: 'Username',
            ),
            verticalRegular,
            TextFormFieldWidget(
              hintText: 'Password',
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
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
