import 'package:camo_app/data/repositories/authentication/authetication_repository.dart';
import 'package:camo_app/data/repositories/user/user_repository.dart';
import 'package:camo_app/features/authentication/screens/signup/verify_email.dart';
import 'package:camo_app/features/personalization/models/user_model.dart';
import 'package:camo_app/utils/constrants/image_strings.dart';
import 'package:camo_app/utils/helpers/network_manager.dart';
import 'package:camo_app/utils/popups/full_screen_loader.dart';
import 'package:camo_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final hidePassword = true.obs; // observable for hiding/showing password
  final privacyPolicy = true.obs; // observable for privacy policy acceptance
  final email = TextEditingController(); //controller for email input
  final lastName = TextEditingController(); //controller for last name input
  final username = TextEditingController(); //controller for user name input
  final password = TextEditingController(); //controller for password input
  final firstName = TextEditingController(); //controller for first name input
  final phoneNumber =
      TextEditingController(); //controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //form key for form validation

  //-- SignUp

  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimaion);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In Order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register user in the Firebase authentication & save user data in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // show success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      // move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // show some generic error to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }
}
