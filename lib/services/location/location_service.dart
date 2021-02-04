import 'package:inspector/services/location/location.dart';

mixin LocationService {

  Future<Location> get actualLocation;
  Stream<Location> get subscribeToLocation;

}