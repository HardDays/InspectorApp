import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Карта',
                style: ProjectTextStyles.title.apply(
                  color: ProjectColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ProjectColors.blue
                ),  
                margin: const EdgeInsets.only(left: 8, top: 3),
                padding: const EdgeInsets.only(left: 15, right: 15),
                alignment: Alignment.center,
                child: Text('1',
                  style: ProjectTextStyles.baseBold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(55.746875, 37.6200),
          zoom: 16.5  ,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c']
          ),
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
    );
  }
}
