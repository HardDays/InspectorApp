import 'package:geolocator/geolocator.dart';
import 'package:inspector/services/location/location.dart';
import 'package:inspector/services/location/location_service.dart';

class GeolocatorLocationService with LocationService {
  @override
  Future<Location> get actualLocation => Geolocator.getCurrentPosition()
      .then(_convert, onError: (_) => Location.noLocationProvided());

  @override
  Stream<Location> get subscribeToLocation =>
      Geolocator.getPositionStream().map(_convert);

  Location _convert(Position position) => Location(
        longitude: position.longitude,
        latitude: position.latitude,
      );
}
