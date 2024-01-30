import 'package:camo_app/common/widgets/appbar/appbar.dart';
import 'package:camo_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:camo_app/common/widgets/products/cart/cupon_widget.dart';
import 'package:camo_app/common/widgets/success_screen/success_screen.dart';
import 'package:camo_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:camo_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:camo_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:camo_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:camo_app/navigation_menu.dart';
import 'package:camo_app/utils/constrants/colors.dart';
import 'package:camo_app/utils/constrants/image_strings.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:camo_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text('Order review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // -- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              //-- Coupon TextField
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    //-- Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //-- Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //-- Payment Methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //-- Address
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      //-- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: TImages.successfulPayment,
              title: 'Payment Success!',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout \$249.0'),
        ),
      ),
    );
  }
}
