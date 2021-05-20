import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class DepartmentControlDateInterceptor extends Interceptor {
  final DateFormat _dateFormat = new DateFormat("yyyy-MM-dd");

  Map<String, RequestOptions Function(RequestOptions)> get _getFunctionsMap => {
    r'/dc-objects$': _onDcObjects,
    r'/dc-objects/\d+/control-results$': _onGetControlResults,
    r'/dc-objects/control-results$': _onGetControlResults,
  };

  Map<String, RequestOptions Function(RequestOptions)> get _postFunctionsMap => {
    r'/dc-objects/\d+/control-results$': _onPostControlResult,
    r'/dc-objects/\d+/control-results/\d+/perform-controls$': _onPostPerformControl,
    r'/dc-objects/\d+/control-results/\d+/op/extend-resolution-period': _onPostViolationExtensionPeriod,
  };

  Map<String, Map<String, RequestOptions Function(RequestOptions)>> get _methodsMap => {
    'GET': _getFunctionsMap,
    'POST': _postFunctionsMap,
    'PATCH': _postFunctionsMap,
  };

  @override
  Future onRequest(RequestOptions options) {
    _methodsMap[options.method]?.forEach((key, value) { 
      if(RegExp(key).hasMatch(options.path)) {
        value(options);
      }
    });
    return super.onRequest(options);
  }

  RequestOptions _onDcObjects(RequestOptions options) {
    [
      'lastSurveyDateFrom',
      'lastSurveyDateTo',
      'detectionDateFrom',
      'detectionDateTo',
      'controlDateFrom',
      'controlDateTo',
    ].forEach((key) => _toParamDate(key, options));
    return options;
  }

  RequestOptions _onGetControlResults(RequestOptions options) {
    [
      'surveyDateFrom',
      'surveyDateTo',
    ].forEach((key) => _toParamDate(key, options));
    return options;
  }

  RequestOptions _onPostControlResult(RequestOptions options) {
    if(options.data['violation'] != null) {
      final resovleDate = options.data['violation']['resolveDate'];
      if(resovleDate != null) {
        options.data['violation']['resolveDate'] = _toDate(resovleDate);
      }
      final controlDate = options.data['violation']['controlDate'];
      if(controlDate != null) {
        options.data['violation']['controlDate'] = _toDate(controlDate);
      }
    }
    return options;
  }

  RequestOptions _onPostPerformControl(RequestOptions options) {
    final planDate = options.data['planDate'];
    if(planDate != null) {
      options.data['resolveDate'] = _toDate(planDate);
    }
    return options;
  }

  RequestOptions _onPostViolationExtensionPeriod(RequestOptions options) {
    // final resolveDate = options.data['resolveDate'];
    // if(resolveDate != null) {
    //   options.data['resolveDate'] = _toDate(resolveDate);
    // }
    return options;
  }

  RequestOptions _toParamDate(String key, RequestOptions options) {
    if (options.queryParameters.containsKey(key)) {
      options.queryParameters[key] = _toDate(options.queryParameters[key]);
    }
    return options;
  }

  String _toDate(dynamic date) {
    if(date is String) {
      return _dateFormat.format(DateTime.parse(date));
    } else {
      return _dateFormat.format(date);
    }
  }
}
