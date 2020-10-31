import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/services/auth_exception.dart';
import 'package:inspector/services/persistance_service.dart';

class AuthService {
  final PersistanceService persistanceService;
  final ApiProvider apiProvider = ApiProvider();

  AuthService(this.persistanceService);

  Future<bool> isAuthentificated() async {
    String token = await persistanceService.getToken();
    if(token != null) {
      apiProvider.setToken(token);
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
      final deviceInfo = DeviceInfoPlugin();
      String deviceId;
      if (Platform.isIOS) {
        deviceId = (await deviceInfo.iosInfo).identifierForVendor;
      } else {
        deviceId = (await deviceInfo.androidInfo).androidId;
      }
      final response = await apiProvider.login(login, password, deviceId);
      final user = User.fromJson(response['employee']);
      final prev = await persistanceService.getPreviousUser();
      if(prev != null && prev.id != user.id) {
        persistanceService.clearAllData();
      }
      persistanceService.saveUser(user);
      persistanceService.setToken(response['token']);
      apiProvider.setToken(response['token']);
      return user;
    } catch (e) {
      throw AuthException('');
    }
  }
}
