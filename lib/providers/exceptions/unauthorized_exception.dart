import 'package:inspector/providers/exceptions/api_exception.dart';

class UnauthorizedException extends ApiException {
  UnauthorizedException(): super('Не авторизован');
}