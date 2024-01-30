import 'package:camo_app/common/widgets/texts/section_heading.dart';
import 'package:camo_app/features/shop/screens/product_detail/widgets/bottom_add_to_cart.dart';
import 'package:camo_app/features/shop/screens/product_detail/widgets/product_attribute.dart';
import 'package:camo_app/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:camo_app/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:camo_app/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:camo_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:camo_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- Product Image Slider
            const TProductImageSlider(),

            // -- Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // -- Rating & Share

                  const TRatingAndShare(),

                  // -- Price, Title, Stock & Brand
                  const TProductMetaData(),

                  // -- Attribute
                  const TProductAttribute(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // -- Checkout Button

                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // -- Description
                  const TSectionHeading(title: 'Description'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a product description for mw3 enigma camo. this is only a sample description.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // -- Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                          title: 'Reviews(23)', showActionButon: false),
                      IconButton(
                          icon: const Icon(Iconsax.arrow_right3, size: 18),
                          onPressed: () =>
                              Get.to(() => const ProductReviewScreen())),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
