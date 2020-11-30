import 'package:inspector/providers/exceptions/api_exception.dart';

class TimeoutException extends ApiException {

  TimeoutException(String details) : super('Отсутствует подключение к интернету', details: '');
}