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

  Future<User> authentificate(String login, String password) async {
    final response = await apiProvider.login(login, password);
    try {
      final user = User.fromJson(response['employee']);
      persistanceService.saveUser(user);
      persistanceService.setToken(response['token']);
      apiProvider.setToken(response['token']);
      return user;
    } catch (e) {
      throw AuthException(response['errorText']);
    }
  }
}
