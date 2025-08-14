import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/routes/app_pages.dart';
import 'package:gelir_gider_app/services/api_service.dart';
import 'package:gelir_gider_app/services/auth_service.dart';
import 'package:gelir_gider_app/services/storage_service.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  @override
  void onReady() async {
    super.onReady();
    await waitForServices();
    await checkTokenandRedirect();
  }

  Future<void> waitForServices() async {
    while (!Get.isRegistered<StorageService>() &&
        !Get.isRegistered<ApiService>() &&
        !Get.isRegistered<AuthService>()) {
      await Future.delayed(const Duration(milliseconds: 1500));
    }
  }

  Future<void> checkTokenandRedirect() async {
    await Get.offAllNamed(AppRoutes.LOGIN);
  }
}
