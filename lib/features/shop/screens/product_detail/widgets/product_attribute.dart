import 'package:camo_app/common/widgets/chips/choice_chip.dart';
import 'package:camo_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:camo_app/common/widgets/texts/product_price_text.dart';
import 'package:camo_app/common/widgets/texts/product_title_text.dart';
import 'package:camo_app/common/widgets/texts/section_heading.dart';
import 'package:camo_app/utils/constrants/colors.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:camo_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductAttribute extends StatelessWidget {
  const TProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);
    return Column(
      children: [
        //-- Selected attribute pricing & description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkergrey : TColors.grey,
          child: Column(
            children: [
              //-- Title, price & Stock Status
              Row(
                children: [
                  const TSectionHeading(
                      title: 'Variation', showActionButon: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Price : ', smallSize: true),

                          //-- Actual price
                          Text(
                            '\$250',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          //-- Sale Price
                          const TProductPriceText(price: '175')
                        ],
                      ),

                      //--Stock
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              //-- variation Description
              const TProductTitleText(
                title:
                    'This is the Description of Product. maximum 4 lines for description.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        //-- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'Gold', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Silver', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Indigo', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Wepons'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: '36', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: '40', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'All', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}
