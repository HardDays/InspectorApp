import 'package:inspector/providers/exceptions/api_exception.dart';

class ServerException extends ApiException {

  ServerException(int code, String data)  : super('Ошибка сервера', details: 'Код: $code, Ошибка: $data');
}