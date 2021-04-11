import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/street.dart';

part 'event.freezed.dart';

@freezed
abstract class AddressFormEvent with _$AddressFormEvent {

  const factory AddressFormEvent.setStringAreaValueEvent(String value) = _SetStringAreaValueEvent;
  const factory AddressFormEvent.setAreaValueEvent(Area area) = _SetAreaValueEvent;

  const factory AddressFormEvent.setStringDistrictValueEvent(String value) = _SetStringDistrictValueEvent;
  const factory AddressFormEvent.setDistrictValueEvent(District district) = _SetDistrictValueEvent;

  const factory AddressFormEvent.setStringStreetValueEvent(String value) = _SetStringStreetValueEvent;
  const factory AddressFormEvent.setStreetValueEvent(Street street) = _SetStreetValueEvent;

  const factory AddressFormEvent.setStringHouseValueEvent(String house) = _SetStringHouseValueEvent;
  
  const factory AddressFormEvent.setAddressEvent(Address address) = _SetAddressEvent;

}