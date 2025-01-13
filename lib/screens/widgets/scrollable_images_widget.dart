import 'package:flutter/material.dart';
import 'package:kwajuafrica/common/widgets/app_bar_actions.dart';
import 'package:kwajuafrica/model/category.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class ScrollableImagesWidget extends StatefulWidget {
  final String title;

  final List<Category> items;

  const ScrollableImagesWidget(
      {super.key, required this.items, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _ScrollableImagesWidgetState createState() => _ScrollableImagesWidgetState();
}

class _ScrollableImagesWidgetState extends State<ScrollableImagesWidget> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    if (_scrollController.offset > 0) {
      _scrollController.animateTo(
        _scrollController.offset - 150,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 150,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row with title and navigation buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Inter(
              text: widget.title,
              fontSize: 20,
            ),
            Row(
              children: [
                AppBarActions(
                  icon: const Icon(
                    Icons.arrow_left,
                    color: AppColors.orange700,
                  ),
                  onTap: _scrollLeft,
                ),
                spaceW10,
                AppBarActions(
                  icon: const Icon(
                    Icons.arrow_right,
                    color: AppColors.orange700,
                  ),
                  onTap: _scrollRight,
                ),
              ],
            ),
          ],
        ),
        spaceH10,

        // Horizontal scrolling text widgets
        SizedBox(
          width: double.infinity,
          height: 70,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return spaceW5;
            },
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return Container(
                width: 74,
                height: 74,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
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
                    backgroundImage: AssetImage(item.image),
                    radius: 35, // Inner circle radius
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
