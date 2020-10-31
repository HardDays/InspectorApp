import 'package:inspector/model/object_category.dart';

class ControlObject {
  final int id;
  final ObjectCategory type;
  final String area;
  final String ownerArea;
  final String district;
  final String customer;
  final String contractor;
  final String kind;
  final String address;
  final int cameraCount;
  final int lastSurveyDateDelta;
  final String lastSurveyDate;
  final String violationsCount;
  final String rowColor;
  final String balanceOwner;
  final List<MapGeometricObject> geometry;

  ControlObject({
    this.id,
    this.type,
    this.area,
    this.ownerArea,
    this.district,
    this.customer,
    this.contractor,
    this.kind,
    this.address,
    this.cameraCount,
    this.lastSurveyDateDelta,
    this.lastSurveyDate,
    this.violationsCount,
    this.rowColor,
    this.balanceOwner,
    this.geometry,
  });

  factory ControlObject.fromJson(Map<String, dynamic> json) {
    return ControlObject(
      type: ObjectCategory.fromJson(json['type']),
      id: json['id'],
      area: json['area'],
      ownerArea: json['ownerArea'],
      district: json['district'],
      customer: json['customer'],
      contractor: json['contractor'],
      kind: json['kind'],
      address: json['address'],
      cameraCount: json['cameraCount'],
      lastSurveyDateDelta: json['lastSurveyDateDelta'],
      lastSurveyDate: json['lastSurveyDate'],
      violationsCount: json['violationsCount'],
      rowColor: json['rowColor'],
      balanceOwner: json['balanceOwner'],
      geometry:
          json['geometry'].map((e) => MapGeometricObject.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toJson(),
      'area': area,
      'ownerArea': ownerArea,
      'district': district,
      'customer': customer,
      'contractor': contractor,
      'kind': kind,
      'address': address,
      'cameraCount': cameraCount,
      'lastSurveyDateDelta': lastSurveyDateDelta,
      'violationsCount': violationsCount,
      'rowColor': rowColor,
      'balanceOwner': balanceOwner,
      'geometry': geometry.map((e) => e.toJson()).toList(),
    };
  }
}

enum MapGeometricObjectType {
  point,
  polyline,
  polygon,
}

class Point {
  final int x;
  final int y;

  Point({
    this.x,
    this.y,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(x: json['x'], y: json['y']);
  }

  Map<String, dynamic> toJson() {
    return {'x': x, 'y': y};
  }
}

const _mapGeometricObjectTypeMap = {
  MapGeometricObjectType.point: 'point',
  MapGeometricObjectType.polyline: 'polyline',
  MapGeometricObjectType.polygon: 'polygon',
};

const _mapGeometricObjectEnumMap = {
  'point': MapGeometricObjectType.point,
  'polyline': MapGeometricObjectType.polyline,
  'polygon': MapGeometricObjectType.polygon,
};

class MapGeometricObject {
  final MapGeometricObjectType type;
  final String color;
  final String label;
  final List<Point> points;

  MapGeometricObject({
    this.type,
    this.color,
    this.label,
    this.points,
  });

  factory MapGeometricObject.fromJson(Map<String, dynamic> json) {
    return MapGeometricObject(
      type: _mapGeometricObjectEnumMap[json['type']],
      color: json['color'],
      label: json['label'],
      points: json['points'].map((e) => Point.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': _mapGeometricObjectTypeMap[type],
      'color': color,
      'label': label,
      'points': points.map((e) => e.toJson()).toList(),
    };
  }
}
