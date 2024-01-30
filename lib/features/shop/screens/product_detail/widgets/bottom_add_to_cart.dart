// Existing import statements...

import 'package:camo_app/common/widgets/icons/t_circular_icon.dart';
import 'package:camo_app/utils/constrants/colors.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:camo_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// Existing import statements...

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? TColors.darkergrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(TSizes.cardRadiusLg),
          topLeft: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: TSizes.spaceBtwItems),
              const TCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                color: TColors.black,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            child: const Row(
              children: [
                TCircularIcon(
                  icon: Iconsax.shopping_bag,
                  width: 20,
                  height: 40,
                  color: TColors.white,
                ),
                SizedBox(width: TSizes.spaceBtwItems),
                Text('Add to Cart'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
