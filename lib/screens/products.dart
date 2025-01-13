import 'package:flutter/material.dart';
import 'package:kwajuafrica/common/app_bar.dart';
import 'package:kwajuafrica/common/widgets/gradient_icon.dart';
import 'package:kwajuafrica/common/widgets/search_widget.dart';
import 'package:kwajuafrica/model/category.dart';
import 'package:kwajuafrica/screens/widgets/categries_widget.dart';
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
                        });
                      },
                    ),
                  ),
                  spaceW10,
                  const GradientIconContainer(),
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
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
            ],
          ),
        ),
      ),
    );
  }
}
