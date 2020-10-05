import 'package:inspector/model/user.dart';
import 'package:inspector/services/auth_exception.dart';
import 'package:inspector/services/auth_service.dart';
import 'package:inspector/services/persistance_service.dart';

class MockAuthService extends AuthService {
  
  MockAuthService(PersistanceService persistanceService) : super(persistanceService);

  @override
  Future<User> authentificate(String login, String password) async {
    await Future.delayed(Duration(seconds: 5));
    if (login != 'test' || password != 'test')
      throw AuthException('Неверный логин или пароль');
    User user = User(
      id: 1,
      code: 'asdf',
      surname: 'qwer',
      name: 'adf',
      middleName: 'zcv',
      position: 'qwe',
    );
    await persistanceService.saveUser(user);
    return user;
  }
}
