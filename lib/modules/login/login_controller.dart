import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/services/auth_service.dart';
import 'package:gelir_gider_app/services/storage_service.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  late final AuthService _authService;
  late final StorageService _storageService;

  RxString userToken = "".obs;

  @override
  void onInit() {
    super.onInit();
    _authService = Get.find<AuthService>();
    _storageService = Get.find<StorageService>();
  }

  @override
  void onReady() {
    super.onReady();
    userToken.value =
        _storageService.getValue<String>(StorageKeys.userToken) ?? "";
  }

  googleIleGirisYap() async {
    await _authService.singInWithGoogle();
  }
}
