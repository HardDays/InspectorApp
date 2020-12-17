import 'package:inspector/providers/exceptions/api_exception.dart';

class UnauthorizedException extends ApiException {
  UnauthorizedException(String details): super('Пожалуйста, перезапустите приложение со включенным интернетом и введите пин-код заново.', details: '');
}