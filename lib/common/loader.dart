import 'package:flutter/material.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.orange500),
      ),
    );
  }
}
