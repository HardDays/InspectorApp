import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/profile/event.dart';
import 'package:inspector/blocs/profile/state.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/services/instruction_request_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:inspector/services/reports_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileBloc(ProfileBlocState initialState, this._persistanceService)
      : super(initialState);

  static const platform =
      const MethodChannel('com.example.inspector/mainChannel');

  final PersistanceService _persistanceService;

  final ReportsService _reportsService = ReportsService();
  final InstructionRequestService _instructionRequestService = InstructionRequestService();
  final ApiProvider _apiProvider = ApiProvider();

  @override
  Stream<ProfileBlocState> mapEventToState(ProfileBlocEvent event) async* {
    if (event is SetUsingFingerPrint) {
      await _persistanceService.saveFingerprintState(event.useFingerPrint);
      FilledBlocState prev = state as FilledBlocState;
      yield (_copyFilledBlocState(prev, useFingerPrint: event.useFingerPrint));
    } else if (event is SetDataSendingMode) {
      FilledBlocState prev = state as FilledBlocState;
      await _persistanceService.saveDataSendingState(event.dataSendingMode);
      yield (_copyFilledBlocState(prev, dataSendingMode: event.dataSendingMode));
    }
    if (event is InitEvent) {
      yield(await _getFilledState(false));
    }
    if (event is SendEmailEvent) {
      await _sendEmail();
    }
    if (event is SendDataEvent) {
      yield(_copyFilledBlocState(state as FilledBlocState, sending: true));
      final requests = await _instructionRequestService.all();
      requests.forEach((key, value) {
        _apiProvider.updateInstruction(key, instructionStatus: value);
      });
      final reports = await _reportsService.readyToSend();
      for (final element in reports) {
        _apiProvider.createReport(element);
        _reportsService.remove(element);
      }
      yield(_copyFilledBlocState(state as FilledBlocState, sending: false, canBeSended: false));
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
    bool dataSendingMode = await _persistanceService.getDataSendingState();
    bool hasErrorReports = (await _reportsService.reportErrors()).isNotEmpty;
    bool canBeSended = (await _reportsService.readyToSend()).isNotEmpty || (await _instructionRequestService.all()).isNotEmpty;
    return FilledBlocState(
      appVersion: '4.3.13-SNAPSHOT',
      dataSendingMode: dataSendingMode == null ? false : dataSendingMode,
      dataSendingState: hasErrorReports ? 'Ошибка' : 'Успешно',
      installDate: await _getInstallDate(),
      lastDataSendingDate: lastDataSendingDate,
      useFingerprint: useFingerPrint == null ? true : useFingerPrint,
      userName: name,
      sending: isSending,
      canBeSended: canBeSended,
    );
  }

  T _whatIsNotNull<T>(T first, T second) {
    return first == null ? second : first;
  }

  FilledBlocState _copyFilledBlocState(FilledBlocState prev, {
    String appVersion,
    bool dataSendingMode,
    String dataSendingState, 
    DateTime installDate,
    DateTime lastDataSendingDate,
    bool useFingerPrint,
    String userName,
    bool sending,
    bool canBeSended,
  }) {
    return FilledBlocState(
      appVersion: _whatIsNotNull(appVersion, prev.appVersion),
      dataSendingMode: _whatIsNotNull(dataSendingMode, prev.dataSendingMode),
      dataSendingState: _whatIsNotNull(dataSendingState, prev.dataSendingState),
      installDate: _whatIsNotNull(installDate, prev.installDate),
      lastDataSendingDate: _whatIsNotNull(lastDataSendingDate, prev.lastDataSendingDate),
      useFingerprint: _whatIsNotNull(useFingerPrint, prev.useFingerprint),
      userName: _whatIsNotNull(userName, prev.userName),
      sending: _whatIsNotNull(sending, prev.sending),
      canBeSended: _whatIsNotNull(canBeSended, prev.canBeSended),
    );
  }

  Future<void> _sendEmail() async {
    final url = 'mailto:oati_support@mos.ru?subject=' +
        Uri.encodeQueryComponent('Мобильное приложение ЕИС ОАТИ');
    if (await canLaunch(url)) {
      await launch(url);
    } else if (Platform.isAndroid) {
      await platform.invokeMethod('sendEmail');
    }
  }
}
