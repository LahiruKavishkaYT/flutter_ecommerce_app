import 'package:camo_app/common/styles/shadows.dart';
import 'package:camo_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:camo_app/common/widgets/icons/t_circular_icon.dart';
import 'package:camo_app/common/widgets/images/t_rounded_image.dart';
import 'package:camo_app/common/widgets/texts/product_price_text.dart';
import 'package:camo_app/common/widgets/texts/product_title_text.dart';
import 'package:camo_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:camo_app/features/shop/screens/product_detail/product_detail.dart';
import 'package:camo_app/utils/constrants/colors.dart';
import 'package:camo_app/utils/constrants/image_strings.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:camo_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);

    //Container with side paddings, color, edges, radius & shadow
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkergrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Whishlist Buton, Discount Tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  // Thumbnail Image
                  const TRoundedImage(
                      imageUrl: TImages.productImage1, applyImageRadius: true),

                  // Sale tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black)),
                    ),
                  ),

                  // Favourite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child:
                        TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Details
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: 'Enigma Camo', smallSize: true),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleTextWithVerifiedIcon(title: 'MWIII')
                ],
              ),
            ),

            // Todo : Add spacer() here to keep the height of each Box same in case 1 or 2 lines of Heading
            const Spacer(),

            // Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Price
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(price: '299.99'),
                ),

                //add to cart button
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(Iconsax.add, color: TColors.white))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
