import 'package:countryman_radar/constants/constants.dart';
import 'package:countryman_radar/controllers/controllers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ui/components/components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put<GlobalController>(GlobalController());
  Get.put<AuthController>(AuthController());
  Get.put<MapController>(MapController());
  Get.put<ThemeController>(ThemeController());
  runApp(CountrymanRadarApp());
}

class CountrymanRadarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return Loading(
      child: GetMaterialApp(
        // translations: Localization(),
        // locale: languageController.getLocale, // <- Current locale
        navigatorObservers: [
          // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
        ],
        debugShowCheckedModeBanner: false,
        //defaultTransition: Transition.fade,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: "/",
        getPages: AppRoutes.routes,
      ),
    );
  }
}