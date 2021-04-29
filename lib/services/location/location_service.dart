import 'package:inspector/services/location/location.dart';

mixin LocationService {

  @Deprecated('use location subscription')
  Future<Location> get actualLocation;
  Stream<Location> get subscribeToLocation;

}