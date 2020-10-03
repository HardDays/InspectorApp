import 'package:inspector/model/user.dart';

abstract class AuthService {
  Future<bool> isAuthentificated();
  Future<bool> isPinCorrect(String pin);
  Future<void> setPin(String pin);
  Future<bool> isPinSetted();
  Future<User> authentificate(String login, String password);
}