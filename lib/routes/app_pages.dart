import 'package:gelir_gider_app/modules/home/home_binding.dart';
import 'package:gelir_gider_app/modules/home/home_page.dart';
import 'package:gelir_gider_app/modules/login/login_binding.dart';
import 'package:gelir_gider_app/modules/login/login_page.dart';
import 'package:gelir_gider_app/modules/splash/splash_binding.dart';
import 'package:gelir_gider_app/modules/splash/splash_page.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static const INITIAL = SPLASH;
  static const SPLASH = "/splash";
  static const LOGIN = "/login";
  static const HOME = "/home";
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
