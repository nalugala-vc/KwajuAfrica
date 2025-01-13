import 'package:flutter/material.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class CategriesWidget extends StatelessWidget {
  final String bgImage;
  final String categoryName;
  const CategriesWidget(
      {super.key, required this.bgImage, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(bgImage),
          radius: 37,
        ),
        spaceH10,
        Inter(
          text: categoryName,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
