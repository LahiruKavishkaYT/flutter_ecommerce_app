import 'package:camo_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:camo_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:camo_app/common/widgets/layout/grid_layout.dart';
import 'package:camo_app/common/widgets/products/product_cards/product_card_vertical.dart';

import 'package:camo_app/common/widgets/texts/section_heading.dart';
import 'package:camo_app/features/shop/screens/all_products/all_products.dart';
import 'package:camo_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:camo_app/utils/constrants/image_strings.dart';

import 'package:camo_app/utils/constrants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Searchbar
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Section Heading
                        TSectionHeading(
                            title: 'Popular Categories',
                            showActionButon: false,
                            textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo Slider
                  const TPromoSlider(banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Heading
                  TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Popular products
                  TGridLayout(
                      itemCount: 2,
                      itemBuilder: (_, index) => const TProductCardVertical())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
