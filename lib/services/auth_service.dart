import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/auth_exception.dart';
import 'package:inspector/services/persistance_service.dart';

class AuthService {
  final PersistanceService persistanceService;
  final ApiProvider apiProvider = ApiProvider();

  AuthService(this.persistanceService);

  Future<String> _deviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    String deviceId;
    if (Platform.isIOS) {
      deviceId = (await deviceInfo.iosInfo).identifierForVendor;
    } else {
      deviceId = (await deviceInfo.androidInfo).androidId;
    }
    return deviceId;
  }

  Future setUrl(String url) async {
    apiProvider.setUrl(url);
    await persistanceService.setUrl(url);
  }

  Future<bool> isAuthentificated() async {
    final token = await persistanceService.getToken();
    if (token != null) {       
      //todo в другой метод может быть
      try {
        final url = await persistanceService.getUrl();
        apiProvider.setUrl(url);
        final refreshToken = await persistanceService.getRefreshToken();
        final deviceId = await _deviceId();
        final response = await apiProvider.refresh(refreshToken, deviceId);
        apiProvider.setToken(response['token']);
        await persistanceService.setToken(response['token']);
        await persistanceService.setRefreshToken(response['refreshToken']);
      } catch (ex) {
        apiProvider.setToken(token);
      }
    }
    return (await persistanceService.getUser()) != null;
  }  

  Future<bool> isPinCorrect(String pin) async {
    return (await persistanceService.getPin()) == pin;
  }

  Future<void> setPin(String pin) async {
    await persistanceService.savePin(pin);
  }

  Future<bool> isPinSetted() async {
    return (await persistanceService.getPin()) != null;
  }

  Future<void> changePin() async {
    final prev = await persistanceService.getUser();
    await persistanceService.clearUserData();
    await persistanceService.savePreviousUser(prev);
  }

  Future<void> logout() async {
    await persistanceService.clearAllData();
    apiProvider.setToken(null);
  }

  Future<User> authentificate(String login, String password) async {
    try {
      final deviceId = await _deviceId();
      final response = await apiProvider.login(login, password, deviceId);
      final user = User.fromJson(response['employee']);
      final prev = await persistanceService.getPreviousUser();
      if(prev != null && prev.id != user.id) {
        persistanceService.clearAllData();
      }
      persistanceService.saveUser(user);
      persistanceService.setToken(response['token']);
      persistanceService.setRefreshToken(response['refreshToken']);
      apiProvider.setToken(response['token']);
      return user;
    } on ApiException catch (e) {
      if(e.message == "Не авторизован")
        throw(AuthException('Неверный логин или пароль'));
      throw AuthException(e.message);
    }
  }
}
