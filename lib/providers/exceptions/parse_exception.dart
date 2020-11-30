
import 'package:inspector/providers/exceptions/api_exception.dart';

class ParseException extends ApiException {

  ParseException() : super('Ошибка парсинга данных');
}