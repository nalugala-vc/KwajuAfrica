import 'package:flutter/material.dart';
import 'package:kwajuafrica/common/widgets/app_bar_actions.dart';
import 'package:kwajuafrica/model/subcategory.dart';
import 'package:kwajuafrica/screens/widgets/tag_widget.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class ScrollableTagsWidget extends StatefulWidget {
  final String title;

  final List<SubCategory> items;

  const ScrollableTagsWidget(
      {super.key, required this.items, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _ScrollableTagsWidgetState createState() => _ScrollableTagsWidgetState();
}

class _ScrollableTagsWidgetState extends State<ScrollableTagsWidget> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    if (_scrollController.hasClients && _scrollController.offset > 0) {
      _scrollController.animateTo(
        _scrollController.offset - 150,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollRight() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.offset + 150,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD1015D), Color(0xFFFF6800)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250,
                child: Inter(
                  text: 'Products in ${widget.title}',
                  fontSize: 20,
                  textAlignment: TextAlign.left,
                  textColor: AppColors.plainWhite,
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    AppBarActions(
                      bgColor: AppColors.plainWhite,
                      borderColor: AppColors.plainWhite,
                      icon: const Icon(
                        Icons.arrow_left,
                        color: AppColors.orange700,
                      ),
                      onTap: () {
                        _scrollLeft();
                      },
                    ),
                    spaceW10,
                    AppBarActions(
                      bgColor: AppColors.plainWhite,
                      borderColor: AppColors.plainWhite,
                      icon: const Icon(
                        Icons.arrow_right,
                        color: AppColors.orange700,
                      ),
                      onTap: () {
                        _scrollRight();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          spaceH15,
          // Displaying subcategories
          SizedBox(
            height: 35,
            child: ListView.separated(
              controller: _scrollController,
              separatorBuilder: (context, index) {
                return spaceW10;
              },
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final subcategory = widget.items[index];
                return TagWidget(
                  fontWeight: FontWeight.w500,
                  textSize: 16,
                  bgColor: Colors.transparent,
                  borderColor: AppColors.plainWhite,
                  onTap: () {
                    // Handle subcategory tap if needed
                  },
                  text: subcategory.name,
                  textColor: AppColors.plainWhite,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
