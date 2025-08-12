import 'package:gelir_gider_app/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
    ); // burada controller oluşturuluyor sayfada oluşturmama gerek kalmadan find ile direkt kullanacağım yani her sayfa açıldığında tekrar tekra oluşturmayacağım?
  }
}
