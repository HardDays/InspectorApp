import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/address.dart';

part 'state.freezed.dart';

@freezed
abstract class AddressFormState with _$AddressFormState {
  const factory AddressFormState({
    String area,
    String district,
    String street,
    String house,
    Address address,
  }) = _AddressFormState;
}