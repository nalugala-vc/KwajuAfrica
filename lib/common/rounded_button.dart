import 'package:flutter/material.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double width;
  final double fontSize;
  final bool border;

  const RoundedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.height = 54,
    this.width = double.maxFinite,
    this.border = false,
    this.fontSize = 16,
    this.backgroundColor,
    this.textColor = AppColors.plainWhite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: width,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFD1015D), Color(0xFFFF6800)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Inter(
              text: label,
              textColor: textColor,
              fontSize: fontSize,
            ),
          )),
    );
  }
}
