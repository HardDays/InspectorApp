import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/notification_bloc/events.dart';
import 'package:inspector/blocs/profile/event.dart';
import 'package:inspector/blocs/profile/state.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/services/instruction_request_service.dart';
import 'package:inspector/services/instructions_service.dart';
import 'package:inspector/services/network_status_service/data_sending_mode_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:inspector/services/reports_service.dart';
import 'package:inspector/style/accept_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileBloc(
    ProfileBlocState initialState,
    this._persistanceService,
    this._dataSendingModeStatusService,
    this._notificationBloc,
  ) : super(initialState);

  static const appVersion = '4.3.13-SNAPSHOT';

  static const platform =
      const MethodChannel('com.example.inspector/mainChannel');

  final PersistanceService _persistanceService;

  final ReportsService _reportsService = ReportsService();
  final InstructionRequestService _instructionRequestService =
      InstructionRequestService();
  final ApiProvider _apiProvider = ApiProvider();

  final DataSendingModeStatusService _dataSendingModeStatusService;

  final _instructionsService = InstructionsService();

  final NotificationBloc _notificationBloc;

  @override
  Stream<ProfileBlocState> mapEventToState(ProfileBlocEvent event) async* {
    if (event is SetUsingFingerPrint) {
      await _persistanceService.saveFingerprintState(event.useFingerPrint);
      FilledBlocState prev = state as FilledBlocState;
      yield (_copyFilledBlocState(prev, useFingerPrint: event.useFingerPrint));
    } else if (event is SetDataSendingMode) {
      //FilledBlocState prev = state as FilledBlocState;
      //await _persistanceService.saveDataSendingState(event.dataSendingMode);
      // yield (_copyFilledBlocState(
      //   prev,
      //   dataSendingMode: event.dataSendingMode,
      // ));
      //_dataSendingModeStatusService.add(event.dataSendingMode);
      _notificationBloc.add(SnackBarNotificationEvent('Автоматический режим отправки данных недоступен.'));
    } else if (event is SetUsingPinMode) {
      FilledBlocState prev = state as FilledBlocState;
      await _persistanceService.saveUsePinState(event.usingPinMode);
      await _persistanceService.saveFingerprintState(false);
      yield (_copyFilledBlocState(
        prev,
        usePin: event.usingPinMode,
        showFingerprintSwitch: event.usingPinMode,
      ));
    } else if (event is SetUseWebVersionOfVK) {
      FilledBlocState prev = state as FilledBlocState;
      await _persistanceService.setUseWebVersionOfVk(event.useWebVersionOfVK);
      yield (_copyFilledBlocState(prev,
          useWebVersionOfVK: event.useWebVersionOfVK));
    }
    if (event is InitEvent) {
      yield (await _getFilledState(false));
      var connectivityResult = await Connectivity().checkConnectivity();
      bool dataSendingMode = await _persistanceService.getDataSendingState();
      if (connectivityResult != ConnectivityResult.none && dataSendingMode) {
        _sendData();
      }
    }
    if (event is SendEmailEvent) {
      await _sendEmail();
    }
    if (event is SendDataEvent) {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        await showDialog(
          context: event.context,
          builder: (ctx) => AcceptDialog(
            cancelTitle: null,
            acceptTitle: 'Ок',
            message: 'Отсутствует интернет-соединение',
          ),
        );
      } else {
        yield (_copyFilledBlocState(state as FilledBlocState, sending: true));
        try {
          await _sendData();
          await showDialog(
            context: event.context,
            builder: (ctx) => AcceptDialog(
              acceptTitle: 'Ок',
              cancelTitle: null,
              message: 'Данные успешно переданы в ЕИС ОАТИ',
            ),
          );
        } catch (ex) {
          await showDialog(
            context: event.context,
            builder: (ctx) => AcceptDialog(
              cancelTitle: null,
              acceptTitle: 'Ок',
              message:
                  'При передаче данных в ЕИС ОАТИ возникла ошибка. ${ex.message}. Обратитесь в СТП',
            ),
          );
        }
      }
      yield (_copyFilledBlocState(state as FilledBlocState,
          sending: false, canBeSended: false));
    }
  }

  Future<DateTime> _getInstallDate() async {
    if (Platform.isAndroid) {
      return DateTime.fromMillisecondsSinceEpoch(
          await platform.invokeMethod('getInstallDate'));
    }
    return null;
  }

  Future<FilledBlocState> _getFilledState(bool isSending) async {
    User user = await _persistanceService.getUser();
    String name =
        '${user.code} ${user.surname} ${user.name} ${user.middleName}';
    DateTime lastDataSendingDate =
        await _persistanceService.getLastDataSendingDate();
    bool useFingerPrint = await _persistanceService.getFingerprintState();
    bool dataSendingMode =
        false; //await _persistanceService.getDataSendingState();
    bool hasErrorReports = (await _reportsService.reportErrors()).isNotEmpty;
    bool canBeSended = (await _reportsService.readyToSend()).isNotEmpty ||
        (await _instructionRequestService.all()).isNotEmpty;
    bool usePin = await _persistanceService.getUsePinState();
    bool showFingerprintSwitch = usePin;
    bool useWebVersionOfVK = await _persistanceService.useWebVersionOfVK();
    _dataSendingModeStatusService.add(dataSendingMode);
    return FilledBlocState(
      appVersion: appVersion,
      dataSendingMode: dataSendingMode == null ? true : dataSendingMode,
      dataSendingState: hasErrorReports ? 'Ошибка' : 'Успешно',
      installDate: await _getInstallDate(),
      lastDataSendingDate: lastDataSendingDate,
      useFingerprint: useFingerPrint,
      userName: name,
      sending: isSending,
      canBeSended: canBeSended,
      usePin: usePin,
      showFingerPrintSwitch: showFingerprintSwitch,
      useWebVersionOfVK: useWebVersionOfVK,
    );
  }

  T _whatIsNotNull<T>(T first, T second) {
    return first == null ? second : first;
  }

  FilledBlocState _copyFilledBlocState(
    FilledBlocState prev, {
    String appVersion,
    bool dataSendingMode,
    String dataSendingState,
    DateTime installDate,
    DateTime lastDataSendingDate,
    bool useFingerPrint,
    String userName,
    bool sending,
    bool canBeSended,
    bool showFingerprintSwitch,
    bool usePin,
    bool useWebVersionOfVK,
  }) {
    return FilledBlocState(
      appVersion: _whatIsNotNull(appVersion, prev.appVersion),
      dataSendingMode: _whatIsNotNull(dataSendingMode, prev.dataSendingMode),
      dataSendingState: _whatIsNotNull(dataSendingState, prev.dataSendingState),
      installDate: _whatIsNotNull(installDate, prev.installDate),
      lastDataSendingDate:
          _whatIsNotNull(lastDataSendingDate, prev.lastDataSendingDate),
      useFingerprint: _whatIsNotNull(useFingerPrint, prev.useFingerprint),
      userName: _whatIsNotNull(userName, prev.userName),
      sending: _whatIsNotNull(sending, prev.sending),
      canBeSended: _whatIsNotNull(canBeSended, prev.canBeSended),
      usePin: _whatIsNotNull(usePin, prev.usePin),
      showFingerPrintSwitch:
          _whatIsNotNull(showFingerprintSwitch, prev.showFingerPrintSwitch),
      useWebVersionOfVK: useWebVersionOfVK ?? prev.showFingerPrintSwitch,
    );
  }

  Future<void> _sendEmail() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    User user = await _persistanceService.getUser();
    final url = Uri.encodeFull(
        'mailto:oati_support@mos.ru?subject=Мобильное приложение ЕИС ОАТИ&body=Пользователь: ${user.code} ${user.surname} ${user.name} ${user.middleName}\nВерсия приложения: $appVersion\nУстройство: ${androidInfo.model}\n');
    if (await canLaunch(url)) {
      await launch(url);
    } else if (Platform.isAndroid) {
      await platform.invokeMethod('sendEmail');
    }
  }

  Future<void> _sendData() async {
    final requests = await _instructionRequestService.all();
    for (final id in requests.keys) {
      await _apiProvider.updateInstruction(id, instructionStatus: requests[id]);
      await _instructionRequestService.remove(id);
    }
    final reports = await _reportsService.readyToSend();
    for (final element in reports) {
      await _reportsService.send(element);
      await _instructionsService.flushReportsDate(element.instructionId);
    }
  }
}
