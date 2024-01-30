import 'package:camo_app/common/widgets/brands/brand_show_case.dart';
import 'package:camo_app/common/widgets/layout/grid_layout.dart';
import 'package:camo_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:camo_app/common/widgets/texts/section_heading.dart';
import 'package:camo_app/utils/constrants/image_strings.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // -- Brands

                const TBrandShowcase(images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1
                ]),
                const TBrandShowcase(images: [
                  TImages.productImage6,
                  TImages.productImage5,
                  TImages.productImage4
                ]),
                const SizedBox(height: TSizes.spaceBtwItems),

                // -- Products
                TSectionHeading(title: 'You might like', onPressed: () {}),
                const SizedBox(height: TSizes.spaceBtwItems),

                TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCardVertical()),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ]);
  }
}
