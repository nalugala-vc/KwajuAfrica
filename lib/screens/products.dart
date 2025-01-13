import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:heroicons/heroicons.dart';
import 'package:kwajuafrica/common/app_bar.dart';
import 'package:kwajuafrica/common/bottom_nav_bar.dart';
import 'package:kwajuafrica/common/loader.dart';
import 'package:kwajuafrica/common/widgets/app_bar_actions.dart';
import 'package:kwajuafrica/common/widgets/gradient_icon.dart';
import 'package:kwajuafrica/common/widgets/search_widget.dart';
import 'package:kwajuafrica/controllers/products_controller.dart';
import 'package:kwajuafrica/model/category.dart';
import 'package:kwajuafrica/screens/widgets/categries_widget.dart';
import 'package:kwajuafrica/screens/widgets/products_widget.dart';
import 'package:kwajuafrica/screens/widgets/scrollable_container_widget.dart';
import 'package:kwajuafrica/screens/widgets/scrollable_container_with_widgets.dart';
import 'package:kwajuafrica/screens/widgets/scrollable_images_widget.dart';
import 'package:kwajuafrica/screens/widgets/scrollable_tags_widget.dart';
import 'package:kwajuafrica/screens/widgets/tag_widget.dart';
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
  final productController = Get.find<ProductsController>();
  String _searchText = '';
  String selectedCategoryName = 'Kitchen';

  CategoryModel? _selectedCategory;

  void _onCategoryTapped(CategoryModel category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 200, // Adjust the scroll distance as needed
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 200, // Adjust the scroll distance as needed
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List<String> tags = ['All', 'Yoghurt', 'Ghee', 'Milk', 'Icecream'];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.microtask(() {
      productController.fetchFeaturedProducts();
      productController.fetchCategories();
    });
  }

  Future<void> _refresh() async {
    // Fetch data again when pulled to refresh
    await _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Obx(
            () => productController.isLoading.value
                ? Loader()
                : Column(
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
                            itemCount: productController.categoriesList.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final category =
                                  productController.categoriesList[index];
                              return CategriesWidget(
                                bgImage: category.image,
                                categoryName: category.name,
                                isActive: category == _selectedCategory,
                                onPressed: () {
                                  _onCategoryTapped(category);
                                },
                              );
                            },
                          )),
                      spaceH10,
                      _selectedCategory != null
                          ? _homePageWithFilters()
                          : _homePageNoFilter()
                    ],
                  ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _homePageWithFilters() {
    return Column(
      children: [
        ScrollableTagsWidget(
          title: _selectedCategory!.name,
          items: _selectedCategory!.subcategories,
        ),

        spaceH15,
        SizedBox(
          height: 30,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return spaceW15;
            },
            itemCount: tags.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return TagWidget(
                bgColor: Colors.transparent,
                borderColor: AppColors.grey400,
                onTap: () {},
                text: tags[index],
                textColor: AppColors.grey400,
              );
            },
          ),
        ),
        spaceH15,
        // ScrollableImagesWidget(
        //   items: categries,
        //   title: 'Brands',
        // ),
        spaceH20,
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.65,
          ),
          itemCount: tags.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return const ProductsWidget();
          },
        )
      ],
    );
  }

  Widget _homePageNoFilter() {
    return Column(
      children: [
        ScrollableContainerWidget(),
        spaceH15,
        ListView.separated(
          separatorBuilder: (context, index) {
            return spaceH20;
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productController.featuredCategoriesList.length,
          itemBuilder: (context, index) {
            final featuredCategoriesList =
                productController.featuredCategoriesList[index];
            final bgColor = (index % 3 == 0)
                ? AppColors.orange350.withOpacity(0.3)
                : (index % 3 == 1)
                    ? AppColors.orange300.withOpacity(0.1)
                    : AppColors.blue400.withOpacity(0.2);

            final textColor = (index % 3 == 0)
                ? AppColors.orange500
                : (index % 3 == 1)
                    ? AppColors.black
                    : AppColors.black;
            return ScrollableContainerWithWidgets(
              bgColor: bgColor,
              textColor: textColor,
              items: featuredCategoriesList.products,
              title: featuredCategoriesList.categoryName,
            );
          },
        ),
      ],
    );
  }
}
