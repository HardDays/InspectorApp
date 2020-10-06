import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/profile/event.dart';
import 'package:inspector/blocs/profile/state.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/services/persistance_service.dart';

class ProfileBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileBloc(ProfileBlocState initialState, this._persistanceService)
      : super(initialState);

  static const platform = const MethodChannel('com.example.inspector/mainChannel');
  
  final PersistanceService _persistanceService;

  @override
  Stream<ProfileBlocState> mapEventToState(ProfileBlocEvent event) async* {
    if (event is SetUsingFingerPrint) {
      await _persistanceService.saveFingerprintState(event.useFingerPrint);
      FilledBlocState prev = state as FilledBlocState;
      yield FilledBlocState(
        appVersion: prev.appVersion,
        dataSendingMode: prev.dataSendingMode,
        dataSendingState: prev.dataSendingState,
        installDate: prev.installDate,
        lastDataSendingDate: prev.lastDataSendingDate,
        useFingerprint: event.useFingerPrint,
        userName: prev.userName,
      );
    } else if (event is SetDataSendingMode) {
      FilledBlocState prev = state as FilledBlocState;
      await _persistanceService.saveDataSendingState(event.dataSendingMode);
      yield FilledBlocState(
        appVersion: prev.appVersion,
        dataSendingMode: event.dataSendingMode,
        dataSendingState: prev.dataSendingState,
        installDate: prev.installDate,
        lastDataSendingDate: prev.lastDataSendingDate,
        useFingerprint: prev.useFingerprint,
        userName: prev.userName,
      );
    }
    if (event is InitEvent) {
      User user = await _persistanceService.getUser();
      String name =
          '${user.position} ${user.surname} ${user.name} ${user.middleName}';
      DateTime lastDataSendingDate =
          await _persistanceService.getLastDataSendingDate();
      bool useFingerPrint = await _persistanceService.getFingerprintState();
      bool dataSendingMode = await _persistanceService.getDataSendingState();
      yield FilledBlocState(
        appVersion: '001-0124',
        dataSendingMode: dataSendingMode == null ? false : dataSendingMode,
        dataSendingState: 'Ошибка',
        installDate: await _getInstallDate(),
        lastDataSendingDate: lastDataSendingDate,
        useFingerprint: useFingerPrint == null ? true : useFingerPrint,
        userName: name,
      );
    }
  }

  Future<DateTime> _getInstallDate() async {
    return DateTime.fromMillisecondsSinceEpoch(await platform.invokeMethod('getInstallDate'));
  }
}
