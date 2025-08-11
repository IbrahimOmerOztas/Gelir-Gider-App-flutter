import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/routes/app_pages.dart';
import 'package:gelir_gider_app/services/api_service.dart';
import 'package:gelir_gider_app/services/storage_service.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    print("on init Splash controller");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    checkServices();
  }

  Future<void> checkServices() async {
    while (!Get.isRegistered<StorageService>() &&
        !Get.isRegistered<ApiService>()) {
      await Future.delayed(const Duration(milliseconds: 1500));
    }

    var map = Get.find<StorageService>().getAllValues();
    print(map);

    Get.offAllNamed(AppRoutes.HOME);
  }
}
