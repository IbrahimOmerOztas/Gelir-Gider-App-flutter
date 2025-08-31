import 'package:gelir_gider_app/services/api_service.dart';
import 'package:gelir_gider_app/services/auth_service.dart';
import 'package:gelir_gider_app/services/storage_service.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<StorageService>(() => StorageService().init());
    /*await Get.putAsync<StorageService>(() async{
      final service = StorageService();
      await service.init();
      return service;
    });*/

    await Get.putAsync<ApiService>(() => ApiService().init());
    await Get.putAsync<AuthService>(() => AuthService().init());
    
  }
}
 // neden önce StorageService i yazdım sonra ApiService i yazdım => çünkü apiService içeririnsde storageService uygulaması var bu yüzden önce storageService initilaze 
 //edilmeli.