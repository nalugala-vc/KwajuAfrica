import 'package:flutter/material.dart';
import 'package:kwajuafrica/common/widgets/app_bar_actions.dart';
import 'package:kwajuafrica/model/category.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class ScrollableContainerWithWidgets extends StatefulWidget {
  final String title;
  final Color bgColor;
  final List<Category> items;
  final Color textColor;
  const ScrollableContainerWithWidgets(
      {super.key,
      required this.bgColor,
      required this.items,
      this.textColor = AppColors.orange500,
      required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _ScrollableContainerWithWidgetsState createState() =>
      _ScrollableContainerWithWidgetsState();
}

class _ScrollableContainerWithWidgetsState
    extends State<ScrollableContainerWithWidgets> {
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
        Container(
          padding: const EdgeInsets.only(top: 15, left: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: widget.bgColor, borderRadius: BorderRadius.circular(8)),
          height: 180,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return spaceW20;
            },
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final category = widget.items[index];
              return _containerWidgets(category.image, category.name);
            },
          ),
        ),
      ],
    );
  }

  Widget _containerWidgets(String img, String text) {
    return Column(children: [
      Container(
        height: 125,
        width: 116,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      spaceH5,
      Inter(
        text: text,
        textColor: widget.textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ]);
  }
}
