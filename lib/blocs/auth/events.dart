abstract class AuthBlocEvent {}

class EnterAuthScreenEvent extends AuthBlocEvent {}

class SetPinEvent extends AuthBlocEvent {
  final String pin;

  SetPinEvent(this.pin);
}

class SetPasswordEvent extends AuthBlocEvent {
  final String password;

  SetPasswordEvent(this.password);
}

class SetLoginEvent extends AuthBlocEvent {
  final String login;

  SetLoginEvent(this.login);

}

class LoginEvent extends AuthBlocEvent {}