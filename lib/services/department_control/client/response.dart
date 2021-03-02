import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';

part 'response.freezed.dart';

@freezed
abstract class ControlResultsResponse with _$ControlResultsResponse {
  const factory ControlResultsResponse.controlResultsListResponse(
    List<ControlResultSearchResult> results,
  ) = _ControlResultsList;

  const factory ControlResultsResponse.emptyResultsListResponse() =
      _EmptyControlResultsList;

  const factory ControlResultsResponse.exceptionResponse(
    ApiException e,
  ) = _ExceptionResponse;
}
