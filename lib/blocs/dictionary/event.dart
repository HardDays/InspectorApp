import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class DictionaryBlocEvent with _$DictionaryBlocEvent {
  const factory DictionaryBlocEvent.initEvent() = _InitEvent;
}