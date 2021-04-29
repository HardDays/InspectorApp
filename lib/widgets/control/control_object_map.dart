import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geodesy/geodesy.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/map_geometric_object_type.dart';
import 'package:inspector/services/location/location.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/widgets/control/control_object/control_object_widget.dart';
import 'package:latlong/latlong.dart';

class MapObject {
  final LatLng point;
  final ControlObject object;

  MapObject({this.point, this.object});
}

class PolygonObject extends MapObject {
  final List<LatLng> points;

  PolygonObject({this.points, LatLng point, ControlObject object})
      : super(object: object, point: point);
}

class PolylineObject extends MapObject {
  final List<LatLng> points;

  PolylineObject({this.points, LatLng point, ControlObject object})
      : super(object: object, point: point);
}

class ControlObjectMap extends StatelessWidget {
  ControlObjectMap({
    Key key,
    this.location,
    this.selectedObject,
    this.controlObjects,
    @required this.selectObject,
    @required this.openControlObject,
    @required this.hasNotViolations,
    @required this.hasViolation,
    this.userLocation,
  }) : super(key: key);

  final MapController mapController = MapController();
  final Location location;
  final ControlObject selectedObject;
  final List<ControlObject> controlObjects;
  final void Function(ControlObject) selectObject;
  final void Function(ControlObject) openControlObject;
  final void Function(ControlObject) hasNotViolations;
  final void Function(ControlObject) hasViolation;
  final Location userLocation;

  void _onObject(MapObject object) {
    mapController.move(object.point, mapController.zoom);
    selectObject(object.object);
  }

  List<MapObject> _pointObjects() {
    final List<MapObject> points = [];
    final objects = controlObjects.where((e) => e.geometry != null);
    for (final object in objects) {
      for (final geom in object.geometry) {
        if (geom.type == MapGeometricObjectType.point) {
          for (final point in geom.points) {
            points.add(
                MapObject(object: object, point: LatLng(point.x, point.y)));
          }
        }
      }
    }
    return points;
  }

  List<PolygonObject> _polygonObjects() {
    final geodesy = Geodesy();
    final List<PolygonObject> polys = [];

    final objects = controlObjects.where((e) => e.geometry != null);
    for (final object in objects) {
      for (final geom in object.geometry) {
        if (geom.type == MapGeometricObjectType.polygon) {
          final points = geom.points.map((e) => LatLng(e.x, e.y)).toList();
          final bounds = LatLngBounds.fromPoints(points);
          final center = geodesy.midPointBetweenTwoGeoPoints(
              bounds.northEast, bounds.southWest);
          polys.add(
              PolygonObject(object: object, point: center, points: points));
        }
      }
    }
    return polys;
  }

  List<PolylineObject> _polylineObjects() {
    final geodesy = Geodesy();
    final List<PolylineObject> polys = [];

    final objects = controlObjects.where((e) => e.geometry != null);
    for (final object in objects) {
      for (final geom in object.geometry) {
        if (geom.type == MapGeometricObjectType.polyline) {
          final points = geom.points.map((e) => LatLng(e.x, e.y)).toList();
          final bounds = LatLngBounds.fromPoints(points);
          final center = geodesy.midPointBetweenTwoGeoPoints(
              bounds.northEast, bounds.southWest);
          polys.add(
              PolylineObject(object: object, point: center, points: points));
        }
      }
    }
    return polys;
  }

  @override
  Widget build(BuildContext context) {
    final points = _pointObjects();
    final polylines = _polylineObjects();
    final polygons = _polygonObjects();
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: location.when(
                (longitude, latitude) => LatLng(latitude, longitude),
                noLocationProvided: () => userLocation.when(
                    (longitude, latitude) => LatLng(latitude, longitude),
                    noLocationProvided: () => LatLng(55.74, 37.63)),
              ),
              zoom: 16.5,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(
                markers: List.generate(
                  points.length,
                  (index) => Marker(
                    width: 20,
                    height: 20,
                    point: points[index].point,
                    builder: (context) {
                      return InkWell(
                        onTap: () => _onObject(points[index]),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ProjectColors.blue,
                          ),
                          width: 20,
                          height: 20,
                        ),
                      );
                    },
                  ),
                ),
              ),
              PolygonLayerOptions(
                polygons: List.generate(
                  polygons.length,
                  (index) {
                    return Polygon(
                        color: ProjectColors.green.withOpacity(0.5),
                        borderColor: ProjectColors.green,
                        borderStrokeWidth: 1,
                        points: polygons[index].points);
                  },
                ),
              ),
              MarkerLayerOptions(
                markers: List.generate(
                  polygons.length,
                  (index) => Marker(
                    width: 20,
                    height: 20,
                    point: polygons[index].point,
                    builder: (context) {
                      return InkWell(
                        onTap: () => _onObject(polygons[index]),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ProjectColors.green,
                          ),
                          width: 20,
                          height: 20,
                        ),
                      );
                    },
                  ),
                ),
              ),
              PolylineLayerOptions(
                polylines: List.generate(
                  polylines.length,
                  (index) {
                    return Polyline(
                        borderColor: ProjectColors.red,
                        color: ProjectColors.red,
                        borderStrokeWidth: 1,
                        points: polylines[index].points);
                  },
                ),
              ),
              MarkerLayerOptions(
                markers: List.generate(
                  polylines.length,
                  (index) => Marker(
                    width: 20,
                    height: 20,
                    point: polylines[index].point,
                    builder: (context) {
                      return InkWell(
                        onTap: () => _onObject(polylines[index]),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ProjectColors.red,
                          ),
                          width: 20,
                          height: 20,
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (userLocation != null)
                userLocation.maybeMap(
                  (l) => MarkerLayerOptions(markers: [
                    Marker(
                      width: 20,
                      height: 20,
                      point: LatLng(
                        l.latitude,
                        l.longitude,
                      ),
                      builder: (context) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ProjectColors.cyan,
                        ),
                      ),
                    ),
                  ]),
                  orElse: () => null,
                ),
            ].where((element) => element != null).toList(),
          ),
          if (selectedObject != null && selectedObject.geometry != null && selectedObject.geometry.isNotEmpty)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ControlObjectWidget(
                        controlObject: selectedObject,
                        onTap: openControlObject,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 20, left: 20, bottom: 10),
                        child: Row(
                          children: [
                            ProjectButton.buildOutlineButton(
                              'Нарушений не выявлено',
                              color: ProjectColors.green,
                              onPressed: () => hasNotViolations(selectedObject),
                            ),
                            Padding(padding: const EdgeInsets.only(left: 20)),
                            ProjectButton.buildOutlineButton(
                              'Зафиксировать нарушение',
                              color: ProjectColors.red,
                              onPressed: () => hasViolation(selectedObject),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
