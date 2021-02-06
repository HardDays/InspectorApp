import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:inspector/model/control_object.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/widgets/control/control_object/control_object_widget.dart';
import 'package:latlong/latlong.dart';

class ControlObjectMap extends StatelessWidget {
  const ControlObjectMap({
    Key key,
    this.selectedObject,
    this.controlObjects,
    @required this.selectObject,
    @required this.openControlObject,
    @required this.hasNotViolations,
    @required this.hasViolation,
  }) : super(key: key);

  final ControlObject selectedObject;
  final List<ControlObject> controlObjects;
  final void Function(ControlObject) selectObject;
  final void Function(ControlObject) openControlObject;
  final void Function(ControlObject) hasNotViolations;
  final void Function(ControlObject) hasViolation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(55.746875, 37.6200),
              zoom: 16.5,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c']),
              PolygonLayerOptions(
                polygons: [
                  Polygon(
                    color: ProjectColors.red.withOpacity(0.5),
                    borderColor: ProjectColors.blue,
                    borderStrokeWidth: 1,
                    points: [
                      LatLng(55.7479487, 37.6207602),
                      LatLng(55.7481479, 37.6206958),
                      LatLng(55.7479849, 37.6194942),
                      LatLng(55.7459921, 37.6205993),
                      LatLng(55.7461612, 37.6208138),
                      LatLng(55.7477554, 37.6199126),
                      LatLng(55.7477192, 37.6202667),
                      LatLng(55.7478581, 37.620374),
                      LatLng(55.7479849, 37.620728),
                    ],
                  ),
                ],
              ),
            ],
          ),
          if (selectedObject != null)
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
