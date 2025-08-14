import 'dart:developer';

import 'package:gelir_gider_app/services/api_service.dart';
import 'package:gelir_gider_app/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthConstants {
  static const String googleClientId =
      "594278150608-02o982voei29jqov9fpi4d3c1re5psts.apps.googleusercontent.com";
}

class AuthService extends GetxService {
  late final StorageService _storageService;
  late final ApiService _apiService;
  late final GoogleSignIn _googleSignIn;

  Future<AuthService> init() async {
    _storageService = Get.find<StorageService>();
    _apiService = Get.find<ApiService>();
    _googleSignIn = GoogleSignIn.instance;

    // initialize() zorunlu hale geldi
    await _googleSignIn.initialize(
      serverClientId: AuthConstants.googleClientId,
    );
    return this;
  }

  Future<void> singInWithGoogle() async {
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
      print("error: $e");
    }
  }
}
