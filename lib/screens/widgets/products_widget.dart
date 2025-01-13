import 'package:flutter/material.dart';
import 'package:kwajuafrica/common/rounded_button.dart';
import 'package:kwajuafrica/screens/widgets/tag_widget.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.blue50,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 113,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/lotion.jpeg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Inter(
                  text: 'Fortified Fresh Vanilla Yoghurt',
                  fontSize: 14,
                  textAlignment: TextAlign.left,
                  fontWeight: FontWeight.w500,
                ),
                spaceH5,
                Inter(
                  text: 'From',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.grey800,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Inter(
                      text: 'Ksh 450',
                      fontSize: 15,
                    ),
                    TagWidget(
                        horizontalPadding: 5,
                        bgColor: Colors.transparent,
                        borderColor: AppColors.orange700,
                        onTap: () {},
                        text: 'Save Ksh 60',
                        textSize: 11,
                        textColor: AppColors.orange700)
                  ],
                ),
                spaceH10,
                RoundedButton(
                  label: 'Choose options',
                  textColor: AppColors.plainWhite,
                  onPressed: () {},
                  height: 40,
                  fontSize: 13,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
