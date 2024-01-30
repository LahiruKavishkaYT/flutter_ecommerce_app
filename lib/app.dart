import 'package:camo_app/bindings/general_bindings.dart';
import 'package:camo_app/utils/constrants/colors.dart';
import 'package:camo_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// -- Use this class to setup thems, initial bindings, animations using Material Widget.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      // show loader or circular process
      home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
