abstract class AuthBlocStates {
  bool get needRebuild;
}

mixin PinCodeState {}

class InitialAuthBlocState extends AuthBlocStates with PinCodeState {
  @override
  bool get needRebuild => false;
}

class ShowPinCodeField extends AuthBlocStates with PinCodeState {
  final bool needRebuild;

  ShowPinCodeField(this.needRebuild);
}

class ShowSetPinScreen extends AuthBlocStates with PinCodeState {
    final bool needRebuild;

  ShowSetPinScreen(this.needRebuild);
}

class ShowRepeatPinScreen extends AuthBlocStates with PinCodeState {
  final bool needRebuild;

  ShowRepeatPinScreen(this.needRebuild);
}

class IncorrencRepeatPinState extends AuthBlocStates with PinCodeState {
  bool get needRebuild => false;
}

class IncorrencPinState extends AuthBlocStates with PinCodeState {
  bool get needRebuild => false;
}

class AutorizedState extends AuthBlocStates with PinCodeState {
  bool get needRebuild => false;
}

class ShowLoginScreen extends AuthBlocStates {
  @override
  bool get needRebuild => true;
}

class ShowLoginLoadingScreen extends AuthBlocStates {
  @override
  bool get needRebuild => false;
}

class ShowLoginErrorScreen extends AuthBlocStates {

  final String errorMessage;

  ShowLoginErrorScreen(this.errorMessage);

  @override
  bool get needRebuild => false;
}