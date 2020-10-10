import 'package:inspector/providers/exceptions/api_exception.dart';

class TimeoutException extends ApiException {

  TimeoutException() : super('Сервер не отвечает');
}