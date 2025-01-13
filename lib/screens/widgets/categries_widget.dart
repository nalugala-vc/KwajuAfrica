import 'package:flutter/material.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class CategriesWidget extends StatelessWidget {
  final String bgImage;
  final String categoryName;
  final bool isActive;
  const CategriesWidget(
      {super.key,
      required this.bgImage,
      required this.categoryName,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 74,
          height: 74,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isActive
                ? const LinearGradient(
                    colors: [
                      AppColors.orange300,
                      AppColors.orange700
                    ], // Gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : const LinearGradient(
                    colors: [
                      AppColors.grey300,
                      AppColors.grey300
                    ], // Gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0), // Border thickness
            child: CircleAvatar(
              backgroundImage: AssetImage(bgImage),
              radius: 35, // Inner circle radius
            ),
          ),
        ),
        spaceH10,
        Inter(
          text: categoryName,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          textColor: isActive ? AppColors.orange700 : AppColors.black,
        )
      ],
    );
  }
}
