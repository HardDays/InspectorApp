// import 'package:inspector/model/user.dart';
// import 'package:inspector/providers/api_provider.dart';
// import 'package:inspector/services/auth_exception.dart';
// import 'package:inspector/services/auth_service.dart';
// import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
// import 'package:inspector/services/persistance_service.dart';

// class MockAuthService extends AuthService {

//   final objPersisistance = ObjectDbPersistanceService();
//   final api = ApiProvider();

//   MockAuthService(PersistanceService persistanceService) : super(persistanceService);

//   @override
//   Future<User> authentificate(String login, String password) async {
//     await objPersisistance.init();

//     try {
//       final res = await api.login(login, password);
//       objPersisistance.saveToken(res['token']);
//       //api.init(res['token']);
//     } catch (ex) {
//       throw AuthException('Неверный логин или пароль');
//     }
//     // await Future.delayed(Duration(seconds: 5));
//     // if (login != 'test' || password != 'test')
//     //   throw AuthException('Неверный логин или пароль');
//     User user = User(
//       id: 1,
//       code: 'asdf',
//       surname: 'qwer',
//       name: 'adf',
//       middleName: 'zcv',
//       position: 'qwe',
//     );
//     await persistanceService.saveUser(user);
//     return user;
//   }
// }
