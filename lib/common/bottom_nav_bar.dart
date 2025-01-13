import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(HeroIcons.home, "Home", 0),
          _buildNavItem(HeroIcons.circleStack, "My savings", 1),
          _buildNavItem(
            HeroIcons.listBullet,
            'Shopping list',
            2,
          ),
          _buildNavItem(HeroIcons.user, "My kwaju", 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(HeroIcons icon, String label, int index) {
    final bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isActive
                  ? [const Color(0xFFD1015D), const Color(0xFFFF6800)]
                  : [Colors.transparent, Colors.transparent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              HeroIcon(
                icon,
                color: isActive ? AppColors.plainWhite : AppColors.grey400,
                style: isActive ? HeroIconStyle.solid : HeroIconStyle.outline,
                size: 20,
              ),
              spaceH2,
              Inter(
                text: label,
                fontSize: 12,
                textColor: isActive ? AppColors.plainWhite : AppColors.grey400,
              )
            ],
          )),
    );
  }
}
