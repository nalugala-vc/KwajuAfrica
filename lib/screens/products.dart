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
import 'package:kwajuafrica/controllers/brand_variants_controller.dart';
import 'package:kwajuafrica/controllers/products_controller.dart';
import 'package:kwajuafrica/model/brand.dart';
import 'package:kwajuafrica/model/category.dart';
import 'package:kwajuafrica/model/subcategory.dart';
import 'package:kwajuafrica/model/type.dart';
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
  final ScrollController _scrollController = ScrollController();
  final productController = Get.find<ProductsController>();
  final brandVariantController = Get.find<BrandVariantsController>();
  String _searchText = '';

  CategoryModel? _selectedCategory;
  SubCategory? _selectedSubCategory;
  Type? _selectedType;
  Brand? _selectedBrand;

  void _onCategoryTapped(CategoryModel category) {
    setState(() {
      _selectedCategory = category;
      _selectFirstSubCategory(category);
      _fetchBrandVariants();
    });
  }

  void _onSubCategoryTapped(SubCategory subCategory) {
    setState(() {
      _selectedSubCategory = subCategory;
      _selectFirstType(subCategory);
      _fetchBrandVariants();
    });
  }

  void _selectFirstSubCategory(CategoryModel category) {
    if (category.subcategories.isNotEmpty) {
      _selectedSubCategory = category.subcategories.first;
      _selectFirstType(_selectedSubCategory!);
    } else {
      _selectedSubCategory = null;
      _selectedType = null;
    }
  }

  void _selectFirstType(SubCategory subCategory) {
    if (subCategory.types.isNotEmpty) {
      _selectedType = subCategory.types.first;
      _selectFirstBrand(_selectedType!);
    } else {
      _selectedType = null;
    }
  }

  void _selectFirstBrand(Type type) {
    if (type.brands.isNotEmpty) {
      _selectedBrand = type.brands.first;
    } else {
      _selectedBrand = null;
    }
  }

  void _onTypeTapped(Type type) {
    setState(() {
      _selectedType = type;
      _selectFirstBrand(type);
      _fetchBrandVariants();
    });
  }

  void _fetchBrandVariants() {
    if (_selectedCategory != null &&
        _selectedSubCategory != null &&
        _selectedType != null &&
        _selectedBrand != null) {
      brandVariantController.fetchBrandVariants(
        categoryId: _selectedCategory!.id,
        subCategoryId: _selectedSubCategory!.subCategoryId,
        typeId: _selectedType!.typeId,
        brandId: _selectedBrand!.brandId,
      );
    }
  }

  void _onBrandTapped(Brand brand) {
    setState(() {
      _selectedBrand = brand;
      _fetchBrandVariants();
    });
  }

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
    await _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
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
        Container(
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
                      text: 'Products in ${_selectedCategory!.name}',
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
                  itemCount: _selectedCategory!.subcategories.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final subcategory = _selectedCategory!.subcategories[index];
                    final isActive = subcategory == _selectedSubCategory;
                    return TagWidget(
                      fontWeight: FontWeight.w500,
                      textSize: 16,
                      bgColor:
                          isActive ? AppColors.plainWhite : Colors.transparent,
                      borderColor: AppColors.plainWhite,
                      onTap: () {
                        _onSubCategoryTapped(subcategory);
                      },
                      text: subcategory.name,
                      textColor:
                          isActive ? AppColors.orange500 : AppColors.plainWhite,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        spaceH15,
        SizedBox(
          height: 30,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return spaceW15;
            },
            itemCount: _selectedSubCategory!.types.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final type = _selectedSubCategory!.types[index];
              final isActive = type == _selectedType;
              return TagWidget(
                bgColor: isActive ? AppColors.orange500 : Colors.transparent,
                borderColor: isActive ? AppColors.orange500 : AppColors.grey400,
                onTap: () {
                  _onTypeTapped(type);
                },
                text: type.name,
                textColor: isActive ? AppColors.plainWhite : AppColors.grey400,
              );
            },
          ),
        ),
        spaceH15,
        if (_selectedType?.brands.isNotEmpty ?? false)
          ScrollableImagesWidget(
            items: _selectedType!.brands,
            title: 'Brands',
            selectedBrand: _selectedBrand,
            onBrandSelected: (brand) {
              _onBrandTapped(brand);
            },
          ),
        spaceH20,
        Obx(() {
          if (brandVariantController.isLoading.value) {
            return const Center(child: Loader());
          }

          final variants = brandVariantController.brandVariantsList;
          if (variants == null || variants.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.inventory_2_outlined,
                    size: 48,
                    color: AppColors.grey400,
                  ),
                  spaceH10,
                  Inter(
                    text: 'No products found for this selection',
                    fontSize: 16,
                    textColor: AppColors.grey400,
                  ),
                ],
              ),
            );
          }

          // Display products grid
          return SingleChildScrollView(
            child: Wrap(
              spacing: 15, // horizontal spacing
              runSpacing: 15, // vertical spacing
              children: List.generate(
                variants.length,
                (index) {
                  final variant = variants[index];
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width - 55) /
                        2, // account for padding and spacing
                    child: ProductsWidget(
                      brandVariant: variant!,
                    ),
                  );
                },
              ),
            ),
          );
        }),
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
