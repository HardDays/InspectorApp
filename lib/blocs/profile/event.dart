abstract class ProfileBlocEvent {}

class SetUsingFingerPrint extends ProfileBlocEvent {
  final bool useFingerPrint;

  SetUsingFingerPrint(this.useFingerPrint);
}

class SetDataSendingMode extends ProfileBlocEvent {
  final bool dataSendingMode;

  SetDataSendingMode(this.dataSendingMode);
}

class InitEvent extends ProfileBlocEvent {}

class SendEmailEvent extends ProfileBlocEvent {}