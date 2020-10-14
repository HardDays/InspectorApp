import 'package:inspector/providers/exceptions/api_exception.dart';

class TimeoutException extends ApiException {

  TimeoutException(String details) : super('Сервер не отвечает', details: details);
}