import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/auth/events.dart';
import 'package:inspector/blocs/auth/states.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/services/auth_exception.dart';
import 'package:inspector/services/auth_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

typedef Stream<S> Dispatcher<E, S>(E event);

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocStates> {
  AuthBloc(
      AuthBlocStates initialState, this._authService, this._persistanceService)
      : super(initialState) {
    _dispatchersMap = {
      EnterAuthScreenEvent: (event) =>
          _onEnterAuthScreenEvent(event as EnterAuthScreenEvent),
      SetPinEvent: (event) => _onSetPinEvent(event as SetPinEvent),
      SetPasswordEvent: (event) =>
          _onSetPasswordEvent(event as SetPasswordEvent),
      SetLoginEvent: (event) => _onSetLoginEvent(event as SetLoginEvent),
      SetUrlEvent: (event) => _onSetUrlEvent(event as SetUrlEvent),
      LoginEvent: (event) => _onLoginEvent(event as LoginEvent),
    };
    add(EnterAuthScreenEvent());
  }

  final AuthService _authService;
  final PersistanceService _persistanceService;
  String pin;
  String login;
  String password;

  Map<Type, Dispatcher<AuthBlocEvent, AuthBlocStates>> _dispatchersMap;

  @override
  Stream<AuthBlocStates> mapEventToState(AuthBlocEvent event) async* {
    try {
      yield* _dispatchersMap[event.runtimeType].call(event);
    } catch (e) {}
  }

  Stream<AuthBlocStates> _onEnterAuthScreenEvent(
      EnterAuthScreenEvent event) async* {
    if (await _authService.isAuthentificated()) {
      if (await _authService.isPinSetted()) {
        yield ShowPinCodeField(true);
        final useFingerPrint = await _persistanceService.getFingerprintState();
        if (useFingerPrint != null && !useFingerPrint &&
            await _checkBiometric()) {
          yield AutorizedState();
        }
      } else {
        yield ShowSetPinScreen(true);
      }
    } else {
      yield ShowLoginScreen();
    }
  }

  Stream<AuthBlocStates> _onSetPinEvent(SetPinEvent event) async* {
    if (await _authService.isPinSetted()) {
      if (await _authService.isPinCorrect(event.pin)) {
        yield AutorizedState();
      } else if (event.pin.length >= 4) {
        yield IncorrencPinState();
      } else {
        yield ShowPinCodeField(false);
      }
    } else {
      if (state is ShowSetPinScreen && event.pin.length == 4) {
        pin = event.pin;
        yield ShowRepeatPinScreen(true);
      }
      if (state is ShowRepeatPinScreen || state is IncorrencRepeatPinState) {
        if (event.pin.length == 4) {
          if (event.pin == pin) {
            await _authService.setPin(event.pin);
            yield AutorizedState();
          } else {
            yield IncorrencRepeatPinState();
          }
        }
      }
    }
  }

  Stream<AuthBlocStates> _onSetPasswordEvent(SetPasswordEvent event) async* {
    password = event.password;
  }

  Stream<AuthBlocStates> _onSetLoginEvent(SetLoginEvent event) async* {
    login = event.login;
  }

  Stream<AuthBlocStates> _onLoginEvent(LoginEvent event) async* {
    yield ShowLoginLoadingScreen();
    try {
      var user = await _authService.authentificate(login, password);
      add(EnterAuthScreenEvent());
    } on AuthException catch (e) {
      yield ShowLoginErrorScreen(e.message);
    }
  }

  Stream<AuthBlocStates> _onSetUrlEvent(SetUrlEvent event) {
    _authService.setUrl(event.url);
  }

  Future<bool> _checkBiometric() async {
    final LocalAuthentication auth = LocalAuthentication();
    return await auth.authenticateWithBiometrics(
        localizedReason: 'Нажмите на сканер отпечатка пальца',
        useErrorDialogs: true,
        stickyAuth: false,
        androidAuthStrings: AndroidAuthMessages(
            signInTitle: "Войти с помощью отпечатка пальца"));
  }
}
