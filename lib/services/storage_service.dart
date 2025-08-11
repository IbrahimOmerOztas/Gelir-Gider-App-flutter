import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageKeys {
  static const String userToken = "user_token";
}

class StorageService extends GetxService {
  late final SharedPreferences _preferences;
  //late final ile daha sonra değer atanacak bildirimi yapıyoruz.

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setValue<T>(String key, T value) async {
    try {
      if (value is String) {
        return await _preferences.setString(key, value);
      } else if (value is int) {
        return await _preferences.setInt(key, value);
      } else if (value is bool) {
        return await _preferences.setBool(key, value);
      } else if (value is double) {
        return await _preferences.setDouble(key, value);
      } else if (value is List<String>) {
        return await _preferences.setStringList(key, value);
      } else {
        throw Exception("Not supported type");
      }
    } catch (e) {
      print("veri eklenirken hata olustu: $e");
      return false;
    }
  }

  T? getValue<T>(String key) {
    try {
      if (_preferences.containsKey(key)) {
        return _preferences.get(key) as T;
      } else {
        throw Exception("No value found");
      }
    } catch (e) {
      print("veri okunurken hata olustu");
      return null;
    }
  }

  Future<bool> removeValue(String key) async {
    try {
      return await _preferences.remove(key);
    } catch (e) {
      print("veri silinirken hata olustu: $e");
      return false;
    }
  }

  Map<String, dynamic> getAllValues() {
    final keys = _preferences.getKeys();
    final map = <String, dynamic>{};

    for (var key in keys) {
      map[key] = _preferences.get(key);
    }

    return map;
  }
}
