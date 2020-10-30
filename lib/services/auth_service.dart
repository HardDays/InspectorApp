import 'package:inspector/model/user.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
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
      final response = await apiProvider.login(login, password);
      final user = User.fromJson(response['employee']);
      final prev = await persistanceService.getPreviousUser();
      if(prev != null && prev.id != user.id) {
        persistanceService.clearAllData();
      }
      persistanceService.saveUser(user);
      persistanceService.setToken(response['token']);
      apiProvider.setToken(response['token']);
      return user;
    } on ApiException catch (e) {
      throw AuthException(e.message);
    }
  }
}
