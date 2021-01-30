import 'package:flutter/material.dart';

abstract class ProfileBlocEvent {}

class SetUsingFingerPrint extends ProfileBlocEvent {
  final bool useFingerPrint;

  SetUsingFingerPrint(this.useFingerPrint);
}

class SetDataSendingMode extends ProfileBlocEvent {
  final bool dataSendingMode;

  SetDataSendingMode(this.dataSendingMode);
}

class SetUsingPinMode extends ProfileBlocEvent {
  final bool usingPinMode;

  SetUsingPinMode(this.usingPinMode);
}

class SetUseWebVersionOfVK extends ProfileBlocEvent {
  final bool useWebVersionOfVK;

  SetUseWebVersionOfVK(this.useWebVersionOfVK);
}


class SendDataEvent extends ProfileBlocEvent {
  final BuildContext context;

  SendDataEvent(this.context);
}

class InitEvent extends ProfileBlocEvent {}

class SendEmailEvent extends ProfileBlocEvent {}