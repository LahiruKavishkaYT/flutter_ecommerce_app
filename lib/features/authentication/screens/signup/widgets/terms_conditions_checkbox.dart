import 'package:camo_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:camo_app/utils/constrants/colors.dart';
import 'package:camo_app/utils/constrants/sizes.dart';
import 'package:camo_app/utils/constrants/text_strings.dart';
import 'package:camo_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TTermsAndConditions extends StatelessWidget {
  const TTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelpFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(
              () => Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged: (value) => controller.privacyPolicy.value =
                      !controller.privacyPolicy.value),
            )),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${TTExts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${TTExts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary),
              ),
              TextSpan(
                  text: '${TTExts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: TTExts.termsofUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
