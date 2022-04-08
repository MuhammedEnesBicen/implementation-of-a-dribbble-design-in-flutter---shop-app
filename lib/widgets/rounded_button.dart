import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback? onPress;

  RoundedButton(
      {required this.color,
      required this.textColor,
      required this.text,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        onPressed: onPress ?? () {},
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        fillColor: color,
      ),
    );
  }
}
