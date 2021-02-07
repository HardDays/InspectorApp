import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.g.dart';
part 'source.freezed.dart';

@freezed
abstract class Source with _$Source {
  const factory Source({
    int id,
    String name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

}