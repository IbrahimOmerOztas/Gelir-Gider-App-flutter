import 'package:gelir_gider_app/core/base_controller.dart';
import 'package:gelir_gider_app/models/category.dart';
import 'package:gelir_gider_app/routes/app_pages.dart';
import 'package:gelir_gider_app/services/api_service.dart';
import 'package:gelir_gider_app/services/auth_service.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  late final AuthService _authService;
  late final ApiService _apiService;

  RxList<Category> categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    _authService = Get.find<AuthService>();
    _apiService = Get.find<ApiService>();
  }

  @override
  void onReady() {
    super.onReady();
    getCategories();
    Future.delayed(const Duration(seconds: 2));
  }

  googleCikisYap() async {
    await _authService.signOut();
    await Get.offAllNamed(AppRoutes.LOGIN);
  }

  Future<void> getCategories() async {
    isLoading = true;

    final response = await _apiService.get(path: ApiConstants.categories);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;

      categories.assignAll(
        responseData.map((e) => Category.fromJson(e)).toList(),
      );
    }

    isLoading = false;
  }
}
