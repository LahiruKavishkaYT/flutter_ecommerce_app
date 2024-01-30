import 'package:camo_app/common/widgets/appbar/appbar.dart';
import 'package:camo_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:camo_app/features/shop/screens/checkout/checkout.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        // -- Items in the Cart
        child: TCartItems(),
      ),

      //-- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Checkout \$249.0'),
        ),
      ),
    );
  }
}
