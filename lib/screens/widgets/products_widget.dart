import 'package:flutter/material.dart';
import 'package:kwajuafrica/common/rounded_button.dart';
import 'package:kwajuafrica/model/brand_variant.dart';
import 'package:kwajuafrica/screens/widgets/tag_widget.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class ProductsWidget extends StatelessWidget {
  final BrandVariant brandVariant;
  const ProductsWidget({super.key, required this.brandVariant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(brandVariant.image),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Inter(
                  text: brandVariant.name,
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
                Inter(
                  text: 'Ksh ${brandVariant.price}',
                  fontSize: 15,
                ),
                spaceH10,
                TagWidget(
                    horizontalPadding: 5,
                    bgColor: Colors.transparent,
                    borderColor: AppColors.orange700,
                    onTap: () {},
                    text: 'Save Ksh ${brandVariant.savings}',
                    textSize: 11,
                    textColor: AppColors.orange700),
                spaceH20,
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
