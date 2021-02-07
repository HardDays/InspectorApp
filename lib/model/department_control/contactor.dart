import 'package:freezed_annotation/freezed_annotation.dart';

part 'contactor.g.dart';
part 'contactor.freezed.dart';

@freezed
abstract class Contractor with _$Contractor {

  const factory Contractor({
    int id,
    String name,
    String inn,
  }) = _Contractor;

  factory Contractor.fromJson(Map<String, dynamic> json) =>
      _$ContractorFromJson(json);
}
