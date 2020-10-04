import 'package:inspector/model/user.dart';
import 'package:inspector/services/persistance_service.dart';

abstract class AuthService {
  final PersistanceService persistanceService;

  AuthService(this.persistanceService);

  Future<bool> isAuthentificated() async {
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

  Future<User> authentificate(String login, String password);
}
