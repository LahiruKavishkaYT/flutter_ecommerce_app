import 'package:camo_app/common/widgets/images/t_rounded_image.dart';
import 'package:camo_app/common/widgets/texts/product_title_text.dart';
import 'package:camo_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:camo_app/utils/constrants/colors.dart';
import 'package:camo_app/utils/constrants/image_strings.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:camo_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelpFunctions.isDarkMode(context)
              ? TColors.darkergrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        //- Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleTextWithVerifiedIcon(title: 'CallofDuty'),
              const Flexible(
                  child: TProductTitleText(title: 'MW 3', maxLines: 1)),

              // Attributes
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'Gold ',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                      text: 'Size ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'All ',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ))
            ],
          ),
        ),
      ],
    );
  }
}
