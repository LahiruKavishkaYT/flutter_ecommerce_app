import 'package:camo_app/data/repositories/authentication/authetication_repository.dart';
import 'package:camo_app/utils/constrants/image_strings.dart';
import 'package:camo_app/utils/helpers/network_manager.dart';
import 'package:camo_app/utils/popups/full_screen_loader.dart';
import 'package:camo_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // Retrieve stored email and password and assign to text controllers
    String? rememberEmail = localStorage.read('REMEMBER_ME_EMAIL');
    String? rememberPassword = localStorage.read('REMEMBER_ME_PASSWORD');

    if (rememberEmail != null && rememberPassword != null) {
      email.text = rememberEmail;
      password.text = rememberPassword;
    }
  }

  // Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging You in...', TImages.docerAnimaion);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using email & password authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
