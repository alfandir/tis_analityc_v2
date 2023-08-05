import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    this.hintText,
    this.enabled = true,
    this.labelText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.validatorText,
    this.keyboardType,
  }) : super(key: key);

  final String? hintText;
  final bool enabled;
  final String? labelText;
  final String? errorText;
  final String? validatorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: obscureText,
      controller: controller,
      enabled: enabled,
      validator: (val) {
        if (validatorText?.isEmpty ?? true) return null;
        return validatorText;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        isDense: false,
        isCollapsed: false,
        hintText: hintText,
        labelText: labelText,
        enabled: enabled,
        errorText: errorText,
        errorBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(
            color: Colors.red,
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(
            width: 0.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
