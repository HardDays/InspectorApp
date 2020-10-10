import 'package:inspector/providers/exceptions/api_exception.dart';

class UnhandledException extends ApiException {
  UnhandledException(String details): super('Ошибка', details: details);
}