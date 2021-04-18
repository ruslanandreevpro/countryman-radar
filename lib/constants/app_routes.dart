import 'package:countryman_radar/ui/auth/auth.dart';
import 'package:countryman_radar/ui/ui.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._(); // это сделано для того, чтобы никто не мог создать экземпляр этого объекта
  static final routes = [
    GetPage(name: '/', page: () => SplashUI()),
    GetPage(name: '/signin', page: () => SignInUI()),
    GetPage(name: '/signup', page: () => SignUpUI()),
    GetPage(name: '/home', page: () => HomeUI()),
    GetPage(name: '/settings', page: () => SettingsUI()),
    GetPage(name: '/update_profile', page: () => UpdateProfileUI()),
  ];
}