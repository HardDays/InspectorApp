import 'package:json_annotation/json_annotation.dart';

part 'contactor.g.dart';

@JsonSerializable()
class Contractor {
  final int id;
  final String name;
  final String inn;

  Contractor({
    this.id,
    this.name,
    this.inn,
  });

  factory Contractor.fromJson(Map<String, dynamic> json) =>
      _$ContractorFromJson(json);
  Map<String, dynamic> toJson() => _$ContractorToJson(this);
}
