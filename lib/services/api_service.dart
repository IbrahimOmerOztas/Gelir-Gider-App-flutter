import 'package:dio/dio.dart';
import 'package:gelir_gider_app/services/storage_service.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

abstract class ApiConstants {
  static const String baseUrl = "";
}

class ApiService extends GetxService {
  late StorageService _storageService;
  late final Dio _dio; // bunu daha sonra 1 defa initialize edeceğiz!!

  Future<ApiService> init() async {
    _storageService = Get.find<StorageService>();
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: "application/json",
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = _storageService.getValue<String>(StorageKeys.userToken);
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await _storageService.removeValue(
              StorageKeys.userToken,
            ); // bunun sayesinde beni login ekranına götürüp yeniden login yapıp yeni bir geçerli token almamı sağlar
          }
          return handler.next(error);
        },
      ),
    );

    return this;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters, //zorunlu değil
    Options? options, // zorunlu değil
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      print("Dio get error: $e");
      rethrow;
    }
  }

  Future<Response> post(
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? queryParameters, //zorunlu değil
    Options? options, // zorunlu değil
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      print("Dio post error: $e");
      rethrow;
    }
  }
}
