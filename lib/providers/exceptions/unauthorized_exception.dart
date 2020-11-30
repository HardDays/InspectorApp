import 'package:inspector/providers/exceptions/api_exception.dart';

class UnauthorizedException extends ApiException {
  UnauthorizedException(String details): super('Не авторизован', details: details);
}