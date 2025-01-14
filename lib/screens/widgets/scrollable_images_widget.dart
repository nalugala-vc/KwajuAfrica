import 'package:flutter/material.dart';
import 'package:kwajuafrica/common/widgets/app_bar_actions.dart';
import 'package:kwajuafrica/model/brand.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class ScrollableImagesWidget extends StatefulWidget {
  final String title;

  final List<Brand> items;
  final Brand? selectedBrand; // Add this
  final Function(Brand) onBrandSelected; // Add this
  const ScrollableImagesWidget({
    super.key,
    required this.items,
    required this.title,
    required this.onBrandSelected, // Add this
    this.selectedBrand, // Add this
  });

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
              final isSelected = widget.selectedBrand == item;
              return GestureDetector(
                onTap: () => widget.onBrandSelected(item),
                child: Container(
                  width: 74,
                  height: 74,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: isSelected // Add highlight for selected brand
                          ? [AppColors.orange500, AppColors.orange700]
                          : [AppColors.grey300, AppColors.grey300],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(item.image),
                      radius: 35,
                    ),
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
