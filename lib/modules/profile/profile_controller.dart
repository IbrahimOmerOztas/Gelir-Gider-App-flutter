import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/models/user.dart';
import 'package:gelir_gider_app/services/auth_service.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  late final AuthService _auth;
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    _auth = Get.find<AuthService>();
  }

  Future<void> profilBilgileriniGetir() async {
    try {
      isLoading = true;
      final getUser = await _auth.getProfileInfo();

      user.value = getUser;
    } catch (e) {
      print("veriler getirilirken hata olustu $e");
    } finally {
      isLoading = false;
    }
  }
}
