abstract class ProfileBlocState {}

class EmptyBlocState extends ProfileBlocState {}

class FilledBlocState extends ProfileBlocState {

  final String appVersion;
  final DateTime installDate;
  final DateTime lastDataSendingDate;
  final String dataSendingState;
  final bool dataSendingMode;
  final bool useFingerprint;
  final String userName;

  FilledBlocState({
    this.userName,
    this.appVersion,
    this.installDate,
    this.lastDataSendingDate,
    this.dataSendingState,
    this.dataSendingMode,
    this.useFingerprint,
  });
}