import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.radius = 8.0,
    this.onPressed,
  });

  final String text;
  final double? height;
  final double? width;
  final double radius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff5CC7A3), Color(0xff265355)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          visualDensity: VisualDensity.compact,
          fixedSize: Size(width ?? double.infinity, height ?? 55),
        ),
        child: Text(text),
      ),
    );
  }
}
