import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';

class GradientIconContainer extends StatelessWidget {
  const GradientIconContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 42,
        height: 45,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFF34315), Color(0xFFFF9800)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: HeroIcon(
            HeroIcons.adjustmentsHorizontal,
            style: HeroIconStyle.outline,
            size: 20,
            color: AppColors.plainWhite,
          ),
        ),
      ),
    );
  }
}
