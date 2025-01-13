import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class SearchWidget extends StatefulWidget {
  final void Function(String)? onChanged;
  final String hintText;
  final TextEditingController searchController;
  const SearchWidget(
      {super.key,
      required this.hintText,
      required this.onChanged,
      required this.searchController});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const HeroIcon(
              HeroIcons.magnifyingGlass,
              style: HeroIconStyle.outline,
              size: 20,
              color: AppColors.grey400,
            ),
            spaceW10,
            Expanded(
              child: TextFormField(
                controller: widget.searchController,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: widget.hintText,
                  hintStyle: GoogleFonts.inter(
                    color: AppColors.grey400,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
