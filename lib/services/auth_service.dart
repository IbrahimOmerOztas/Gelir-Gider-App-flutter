import 'package:gelir_gider_app/services/api_service.dart';
import 'package:gelir_gider_app/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  late final StorageService _storageService;
  late final ApiService _apiService;
  late final GoogleSignIn _googleSignIn;

  Future<AuthService> init() async {
    _storageService = Get.find<StorageService>();
    _apiService = Get.find<ApiService>();
    _googleSignIn = GoogleSignIn.instance;
    return this;
  }

  singInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      //ne olur ne olmaz cikis islemini yap sonucta login yapacam

      final GoogleSignInAccount? _googleUser = await _googleSignIn
          .authenticate();
      if (_googleUser == null) return;
      final GoogleSignInAuthentication _googleAuth = _googleUser.authentication;

      print("google user: ${_googleUser.toString()}");
      print("token: ${_googleAuth.idToken}");
    } catch (e) {
      print(e);
    }
  }
}
