import 'package:flutter/material.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';

class AppBarActions extends StatelessWidget {
  final Widget icon;
  final Color borderColor;
  final Color bgColor;
  final VoidCallback onTap;

  const AppBarActions({
    super.key,
    required this.icon,
    this.borderColor = AppColors.grey300,
    this.bgColor = Colors.transparent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
