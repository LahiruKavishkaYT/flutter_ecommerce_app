import 'package:camo_app/common/widgets/appbar/appbar.dart';
import 'package:camo_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:flutter/material.dart';
import 'widget/rating_progress_indicator.dart';
import 'widget/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-- App Bar
      appBar:
          const TAppBar(title: Text('Reviews & ratings'), showBackArrow: true),

      //-- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use Our Service.'),
              const SizedBox(height: TSizes.spaceBtwItems),

              //-- Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              //-- User Review List
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
