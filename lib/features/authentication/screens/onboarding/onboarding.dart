import 'package:camo_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:camo_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:camo_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:camo_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:camo_app/utils/constrants/image_strings.dart';
import 'package:camo_app/utils/constrants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/onboarding_dot_navigation.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTExts.onBoardingTitle1,
                subTitle: TTExts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTExts.onBoardingTitle2,
                subTitle: TTExts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTExts.onBoardingTitle3,
                subTitle: TTExts.onBoardingSubTitle3,
              ),
            ],
          ),

          ///Skip button
          const OnBoardingSkip(),

          ///Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          ///Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
