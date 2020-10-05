import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/auth/events.dart';
import 'package:inspector/blocs/auth/states.dart';
import 'package:inspector/services/auth_exception.dart';
import 'package:inspector/services/auth_service.dart';

typedef Stream<S> Dispatcher<E, S>(E event);

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocStates> {
  AuthBloc(AuthBlocStates initialState, this._authService)
      : super(initialState) {
    _dispatchersMap = {
      EnterAuthScreenEvent: (event) =>
          _onEnterAuthScreenEvent(event as EnterAuthScreenEvent),
      SetPinEvent: (event) => _onSetPinEvent(event as SetPinEvent),
      SetPasswordEvent: (event) => _onSetPasswordEvent(event as SetPasswordEvent),
      SetLoginEvent: (event) => _onSetLoginEvent(event as SetLoginEvent),
      LoginEvent: (event) => _onLoginEvent(event as LoginEvent),
    };
    add(EnterAuthScreenEvent());
  }
  
  final AuthService _authService;
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
      if(await _authService.isPinSetted()) {
        yield ShowPinCodeField(true);
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
      if(state is ShowSetPinScreen && event.pin.length == 4) {
        pin = event.pin;
        yield ShowRepeatPinScreen(true);
      }
      if(state is ShowRepeatPinScreen || state is IncorrencRepeatPinState) {
        if(event.pin.length == 4) {
          if(event.pin == pin) {
            await _authService.setPin(event.pin);
            yield ShowPinCodeField(true);
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
}
