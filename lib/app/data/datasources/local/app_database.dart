import 'package:get_storage/get_storage.dart';

class LocalStorageKeys {
  static const KEY_TOKEN = "token";
  static const KEY_USER_ID = "user_id";
}

class LocalStorage {
  static final GetStorage _storage = GetStorage();

  static saveToken(String token) {
    _storage.write(LocalStorageKeys.KEY_TOKEN, token);
  }

  static String readToken() {
    return _storage.read(LocalStorageKeys.KEY_TOKEN) ?? "";
  }

  static String readUserId() {
    return _storage.read(LocalStorageKeys.KEY_USER_ID) ?? "";
  }

  static saveUserId(String userId) {
    _storage.write(LocalStorageKeys.KEY_USER_ID, userId);
  }
}
