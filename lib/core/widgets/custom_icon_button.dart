import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double padding;
  final Color? bgColor;
  final Color? iconColor;
  final double? size;

  const CustomIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.padding = 15,
      this.bgColor,
      this.iconColor,
      this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.all(padding),
        alignment: Alignment.center,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(bgColor ?? Colors.grey.withOpacity(0.2)), shape: MaterialStateProperty.all(const CircleBorder())),
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: size,
          color: iconColor ?? Colors.black.withOpacity(0.4),
        ));
  }
}
