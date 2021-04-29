import 'package:geolocator/geolocator.dart';
import 'package:inspector/services/location/location.dart';

import 'location_service.dart';

class GeoLocator2LocationService with LocationService {
  Stream<Location> _locationStream;

  GeoLocator2LocationService() {
    _locationStream = _createLocationStream().asBroadcastStream();
  }

  Stream<Location> _createLocationStream() async* {
    while (true) { // TODO: rewrite it without while(true)
      print('New stream');
      yield* Geolocator.getPositionStream(timeLimit: Duration(seconds: 5)).map(_convert);
      print('Stream end');
      yield Location.noLocationProvided();
      while(!await Geolocator.isLocationServiceEnabled()) {
        await Future.delayed(Duration(seconds: 1));
      }
    }
  }

  Location _convert(Position position) => Location(
        longitude: position.longitude,
        latitude: position.latitude,
      );

  @override
  Future<Location> get actualLocation => Geolocator.getCurrentPosition().then(_convert);

  @override
  Stream<Location> get subscribeToLocation => _locationStream;
}
