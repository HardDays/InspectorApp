import 'package:inspector/model/user.dart';

mixin UserMixin {
  Future<void> savePin(String pin);
  Future<void> saveUser(User user);
  Future<String> getPin();
  Future<User> getUser();
  Future<void> saveFingerprintState(bool state);
  Future<void> saveDataSendingState(bool state);
  Future<String> getToken();
  Future<String> getRefreshToken();
  Future<void> setToken(String token);
  Future<void> setRefreshToken(String token);

  Future<bool> getFingerprintState();
  Future<bool> getDataSendingState();

  Future<void> clearUserData();
  Future<User> getPreviousUser();
  Future<void> savePreviousUser(User user);
  Future<void> clearAllData();
}