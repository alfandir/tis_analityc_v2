import 'package:flutter/material.dart';
import 'package:tis_analytic/common/const.dart';
import 'package:tis_analytic/widgets/text_form_field_widget.dart';

import '../../widgets/cutom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscured = true;
  String? _gender;
  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextFormFieldWidget(
              hintText: 'Name',
            ),
            verticalRegular,
            const TextFormFieldWidget(
              hintText: 'Email',
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
            const TextFormFieldWidget(
              hintText: 'Tempat Lahir',
            ),
            verticalRegular,
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Gender',
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
              value: _gender,
              items: ['L', 'P'].map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) => setState(() => _gender = value),
              validator: (value) {
                if (value == null) {
                  return 'Please select your gender';
                }
                return null;
              },
            ),
            verticalRegular,
            CustomButton(
              text: 'Register',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
