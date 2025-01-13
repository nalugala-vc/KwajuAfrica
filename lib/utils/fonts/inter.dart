import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';

class Inter extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double fontSize;
  final bool shouldTruncate;
  final FontWeight fontWeight;
  final int truncateLength;
  final TextAlign textAlignment;
  final bool underline; // New parameter for underline

  Inter({
    super.key,
    required this.text,
    this.shouldTruncate = true,
    this.textColor,
    this.fontSize = 0,
    this.truncateLength = 45,
    this.fontWeight = FontWeight.bold,
    this.textAlignment = TextAlign.center,
    this.underline = false, // Default underline set to false
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveTextColor = textColor ?? AppColors.black;
    return Text(
      shouldTruncate
          ? text.length > truncateLength
              ? '${text.substring(0, truncateLength)}...'
              : text
          : text,
      textAlign: textAlignment,
      style: GoogleFonts.inter(
        color: effectiveTextColor,
        fontSize: fontSize == 0 ? 36 : fontSize,
        fontWeight: fontWeight,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
