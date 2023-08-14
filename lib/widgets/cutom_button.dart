import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final void Function()? onPressed;
  final Color? backgroundColor;
  const CustomButton({
    Key? key,
    this.text,
    this.textColor,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(backgroundColor ?? Colors.orange[200]),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          text ?? '',
          style: TextStyle(
            color: textColor ?? Colors.lightBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
