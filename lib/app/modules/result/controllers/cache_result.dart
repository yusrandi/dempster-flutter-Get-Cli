import 'package:get_storage/get_storage.dart';

mixin CacheResult {
  Future<bool> saveResult({String? id = '', double? value = 0.0}) async {
    final box = GetStorage();
    await box.write(CacheResultKey.ID.toString(), id);
    await box.write(CacheResultKey.VALUE.toString(), value);
    return true;
  }

  String? getID() {
    final box = GetStorage();
    return box.read(CacheResultKey.ID.toString());
  }

  double? getValue() {
    final box = GetStorage();
    return box.read(CacheResultKey.VALUE.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheResultKey.ID.toString());
    await box.remove(CacheResultKey.VALUE.toString());
  }
}

enum CacheResultKey { ID, VALUE }
