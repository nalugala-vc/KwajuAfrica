import 'package:flutter/material.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';

class TagWidget extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final double textSize;
  final FontWeight fontWeight;
  final VoidCallback onTap;
  final double horizontalPadding;
  final double verticalPadding;
  const TagWidget({
    super.key,
    required this.bgColor,
    required this.borderColor,
    required this.onTap,
    this.horizontalPadding = 14,
    this.verticalPadding = 4,
    required this.text,
    this.fontWeight = FontWeight.w500,
    this.textSize = 12,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(
              color: borderColor,
              width: 1.50,
            ),
            borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        child: Inter(
          text: text,
          textColor: textColor,
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
