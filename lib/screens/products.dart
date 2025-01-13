import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:kwajuafrica/common/app_bar.dart';
import 'package:kwajuafrica/common/bottom_nav_bar.dart';
import 'package:kwajuafrica/common/widgets/gradient_icon.dart';
import 'package:kwajuafrica/common/widgets/search_widget.dart';
import 'package:kwajuafrica/model/category.dart';
import 'package:kwajuafrica/screens/widgets/categries_widget.dart';
import 'package:kwajuafrica/screens/widgets/scrollable_container_widget.dart';
import 'package:kwajuafrica/screens/widgets/scrollable_container_with_widgets.dart';
import 'package:kwajuafrica/utils/colors/app_colors.dart';
import 'package:kwajuafrica/utils/fonts/inter.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  List<Category> categries = [
    Category(id: 1, name: 'Kitchen', image: 'assets/images/kitchen.jpeg'),
    Category(id: 2, name: 'Home bar', image: 'assets/images/homebar.jpeg'),
    Category(
        id: 3, name: 'Living area', image: 'assets/images/livingarea.jpeg'),
    Category(id: 4, name: 'Bathroom', image: 'assets/images/bathroom.jpeg')
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Inter(
                text: 'Hello Anna! 👋',
                fontSize: 20,
              ),
              Inter(
                text: 'What are you buying from us today?',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                textColor: AppColors.grey400,
              ),
              spaceH20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SearchWidget(
                      hintText: 'Search',
                      searchController: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchText = value;
                          print(_searchText);
                        });
                      },
                    ),
                  ),
                  spaceW10,
                  const GradientIconContainer(),
                ],
              ),
              spaceH15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Inter(
                    text: 'Categories',
                    fontSize: 20,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Inter(
                          text: 'View all',
                          fontSize: 16,
                          textColor: AppColors.orange500,
                          fontWeight: FontWeight.w500,
                        ),
                        spaceW5,
                        const HeroIcon(
                          HeroIcons.chevronRight,
                          style: HeroIconStyle.solid,
                          color: AppColors.orange500,
                          size: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              spaceH15,
              SizedBox(
                height: 110,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return spaceW20;
                  },
                  itemCount: categries.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final category = categries[index];
                    return CategriesWidget(
                      bgImage: category.image,
                      categoryName: category.name,
                    );
                  },
                ),
              ),
              spaceH10,
              ScrollableContainerWidget(),
              spaceH15,
              ScrollableContainerWithWidgets(
                bgColor: AppColors.orange350.withOpacity(0.3),
                items: categries,
                title: 'Kitchen',
              ),
              spaceH15,
              ScrollableContainerWithWidgets(
                bgColor: AppColors.orange300.withOpacity(0.1),
                items: categries,
                textColor: AppColors.black,
                title: 'Shower & Bath',
              ),
              spaceH15,
              ScrollableContainerWithWidgets(
                bgColor: AppColors.blue400.withOpacity(0.2),
                items: categries,
                textColor: AppColors.black,
                title: 'Mom & Baby',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
