import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/address_bloc/event.dart';
import 'package:inspector/blocs/address_bloc/state.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/street.dart';

class AddressFormBloc extends Bloc<AddressFormEvent, AddressFormState> {
  AddressFormBloc({Address address})
      : super(
          AddressFormState(
            area: address?.area?.name ?? '',
            district: address?.district?.name ?? '',
            street: address?.street?.name ?? '',
            house: address == null ? '' : _houseFormatter(address),
            address: address ?? Address(),
          ),
        );

  @override
  Stream<AddressFormState> mapEventToState(AddressFormEvent event) => event.map(
        setAddressEvent: (event) async* {
          yield (_fromAddress(event.address));
        },
        setAreaValueEvent: (event) async* {
          yield (_fromAddress(state.address.copyWith(area: event.area)));
        },
        setDistrictValueEvent: (event) async* {
          yield (_fromAddress(state.address.copyWith(district: event.district)));
        },
        setStreetValueEvent: (event) async* {
          yield (_fromAddress(state.address.copyWith(street: event.street)));
        },
        setStringAreaValueEvent: (event) async* {
          yield (_fromAddress(state.address.copyWith(area: Area(name: event.value))));
        },
        setStringDistrictValueEvent: (event) async* {
          yield (_fromAddress(state.address.copyWith(district: District(name: event.value))));
        },
        setStringStreetValueEvent: (event) async* {
          yield (_fromAddress(state.address.copyWith(street: Street(name: event.value))));
        },
        setStringHouseValueEvent: (event) async* {
          yield (_fromAddress(state.address.copyWith(houseNum: event.house)));
        },
      );

  static String _houseFormatter(Address address) => [
        address.houseNum,
        address.buildNum,
        address.constructionNum
      ].where((x) => x != null).join(', ');

  AddressFormState _fromAddress(Address address) => AddressFormState(
        address: address,
        area: address.area?.name ?? '',
        district: address.district?.name ?? '',
        street: address.street?.name ?? '',
        house: _houseFormatter(address),
      );
}
