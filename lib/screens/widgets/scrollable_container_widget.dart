import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:kwajuafrica/common/widgets/app_bar_actions.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class ScrollableContainerWidget extends StatefulWidget {
  @override
  _ScrollableContainerWidgetState createState() =>
      _ScrollableContainerWidgetState();
}

class _ScrollableContainerWidgetState extends State<ScrollableContainerWidget> {
  final List<String> _categories = [
    'Bathroom',
    'Kitchen',
    'Living area',
    'Homebar'
  ];
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _scrollLeft() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollRight() {
    if (_currentIndex < _categories.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row with title and navigation buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Super Deals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                AppBarActions(
                    icon: const Icon(
                      Icons.arrow_left,
                      color: AppColors.orange700,
                    ),
                    onTap: () {
                      if (_currentIndex > 0) {
                        _scrollLeft();
                      }
                    }),
                spaceW10,
                AppBarActions(
                    icon: const Icon(
                      Icons.arrow_right,
                      color: AppColors.orange700,
                    ),
                    onTap: () {
                      if (_currentIndex < _categories.length - 1) {
                        _scrollRight();
                      }
                    })
              ],
            ),
          ],
        ),
        spaceH10,

        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final isCurrent = _currentIndex == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: screenWidth,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isCurrent
                        ? [const Color(0xFFD1015D), const Color(0xFFFF6800)]
                        : [Colors.grey.shade300, Colors.grey.shade500],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _tagWidget(_categories[index]),
                          spaceH20,
                          SizedBox(
                            width: double.infinity,
                            child: Inter(
                              text: 'Get 50% off 3 body lotions',
                              textColor: AppColors.plainWhite,
                              fontSize: 16,
                              textAlignment: TextAlign.left,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          spaceH10,
                          Row(
                            children: [
                              Inter(
                                text: 'Order now ',
                                textColor: AppColors.plainWhite,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                              spaceW5,
                              const HeroIcon(
                                HeroIcons.arrowLongRight,
                                style: HeroIconStyle.solid,
                                color: AppColors.plainWhite,
                                size: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // Image container with fixed width
                    Container(
                      width: 180,
                      height: 123,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/lotion.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                )),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _tagWidget(String text) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.plainWhite, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Inter(
        text: text,
        textColor: AppColors.orange500,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
