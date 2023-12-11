import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:interview_test/common/controller/localization_controller.dart';
import 'package:interview_test/common/controller/theme_controller.dart';
import 'package:interview_test/common/model/messages.dart';
import 'package:interview_test/helper/di_container.dart';
import 'package:interview_test/helper/route_helper.dart';
import 'package:interview_test/theme/dark_theme.dart';
import 'package:interview_test/theme/light_theme.dart';
import 'package:interview_test/util/app_constants.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  if(GetPlatform.isIOS || GetPlatform.isAndroid) {
    HttpOverrides.global = MyHttpOverrides();
  }
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await init();

  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          theme: themeController.darkTheme ? darkTheme : lightTheme,
          locale: localizeController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
          initialRoute: RouteHelper.splash,
          getPages: RouteHelper.routes,
          defaultTransition: Transition.topLevel,
          transitionDuration: const Duration(milliseconds: 500),
        );
      },
      );
    },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}