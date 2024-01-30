import 'package:camo_app/common/widgets/appbar/appbar.dart';
import 'package:camo_app/common/widgets/appbar/tabbar.dart';
import 'package:camo_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:camo_app/common/widgets/brands/brand_card.dart';
import 'package:camo_app/common/widgets/layout/grid_layout.dart';
import 'package:camo_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:camo_app/common/widgets/texts/section_heading.dart';
import 'package:camo_app/features/shop/screens/brand/all_brands.dart';
import 'package:camo_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:camo_app/utils/constrants/colors.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:camo_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // -- Appbar
        appBar: TAppBar(
          title: const Text('Store'),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor: Colors.white,
            ),
          ],
        ),
        body: NestedScrollView(
          // -- Header
          headerSliverBuilder: (_, innerBoxIscrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelpFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //-- Search Bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      //-- Featured Brands
                      TSectionHeading(
                        title: 'Featured Games',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      // -- Brands Grid
                      TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const TBrandCard(showBorder: false);
                          })
                    ],
                  ),
                ),

                // -- Tabs
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Camos')),
                    Tab(child: Text('Games')),
                    Tab(child: Text('Components')),
                    Tab(child: Text('Accounts')),
                    Tab(child: Text('Other')),
                  ],
                ),
              ),
            ];
          },
          // -- Body
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
