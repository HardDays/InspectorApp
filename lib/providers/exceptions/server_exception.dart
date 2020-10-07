import 'package:inspector/providers/exceptions/api_exception.dart';

class ServerException implements ApiException {
  final int code;
  final String data;

  ServerException(this.code, this.data);
}