import 'package:inspector/model/user.dart';
import 'package:inspector/services/auth_exception.dart';
import 'package:inspector/services/auth_service.dart';

class MockAuthService extends AuthService {
  String _pin;
  bool isLoggined = false;

  @override
  Future<bool> isPinCorrect(String pin) async {
    return _pin != null && pin == _pin;
  }

  @override
  Future<bool> isPinSetted() async {
    return _pin != null;
  }

  @override
  Future<void> setPin(String pin) async {
    _pin = pin;
  }

  @override
  Future<bool> isAuthentificated() async {
    return isLoggined;
  }

  @override
  Future<User> authentificate(String login, String password) async {
    await Future.delayed(Duration(seconds: 5));
    if (login != 'test' || password != 'test')
      throw AuthException('Неверный логин или пароль');
    isLoggined = true;
    return User(
      id: 1,
      code: 'asdf',
      surname: 'qwer',
      name: 'adf',
      middleName: 'zcv',
      position: 'qwe',
    );
  }
}
