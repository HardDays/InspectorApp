import 'dart:convert' as c;

class ViolatorAddress {
  final String cladrCode;
  final String zipCode;
  final String subjectCode;
  final String subjectName;
  final String subjectType;
  final String regionName;
  final String regionType;
  final String cityName;
  final String cityType;
  final String placeName;
  final String placeType;
  final String streetName;
  final String streetType;
  final String house;
  final String building;
  final String buildingExt;
  final String flat;

  ViolatorAddress({
    this.cladrCode,
    this.zipCode,
    this.subjectCode,
    this.subjectName,
    this.subjectType,
    this.regionName,
    this.regionType,
    this.cityName,
    this.cityType,
    this.placeName,
    this.placeType,
    this.streetName,
    this.streetType,
    this.house,
    this.building,
    this.buildingExt,
    this.flat,
  });

  factory ViolatorAddress.fromJson(Map<String, dynamic> json) {
    return ViolatorAddress(
      cladrCode: json['cladrCode'],
      zipCode: json['zipCode'],
      subjectCode: json['subjectCode'],
      subjectName: json['subjectName'],
      subjectType: json['subjectType'],
      regionName: json['regionName'],
      regionType: json['regionType'],
      cityName: json['cityName'],
      cityType: json['cityType'],
      placeName: json['placeName'],
      placeType: json['placeType'],
      streetName: json['streetName'],
      streetType: json['streetType'],
      house: json['house'],
      building: json['building'],
      buildingExt: json['buildingExt'],
      flat: json['flat'],
    );
  }

  ViolatorAddress copyWith({
    String zipCode,
    String subjectName,
    String regionName,
    String cityName,
    String placeName,
    String streetName,
    String house,
    String building,
    String buildingExt,
    String flat
  }) {
    return ViolatorAddress(
      cladrCode: cladrCode,
      zipCode: zipCode,
      subjectCode: subjectCode,
      subjectName: subjectName,
      subjectType: subjectType,
      regionName: regionName,
      regionType: regionType,
      cityName: cityName,
      placeName: placeName,
      placeType: placeType,
      streetName: streetName,
      streetType: streetType,
      house: house,
      building: building,
      buildingExt: buildingExt,
      flat: flat,
      cityType: cityType
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'cladrCode': cladrCode,
      'zipCode': zipCode,
      'subjectCode': subjectCode,
      'subjectName': subjectName,
      'subjectType': subjectType,
      'regionName': regionName,
      'regionType': regionType,
      'cityName': cityName,
      'cityType': cityType,
      'placeName': placeName,
      'placeType': placeType,
      'streetName': streetName,
      'streetType': streetType,
      'house': house,
      'building': building,
      'buildingExt': buildingExt,
      'flat': flat,
    };
  }

  List<String> data() {
    return [zipCode, regionType, regionName, cityType, cityName, streetType, streetName, house, building, buildingExt, flat].where((e)=> e != null && e.isNotEmpty).toList();
  }

  bool valid() {
    return data().isNotEmpty;
  }

  @override 
  String toString() {
    return data().join(', ');
  }

  static ViolatorAddress parse(dynamic json, bool stringified) {
    if (json != null) {
      if (stringified) {
        return ViolatorAddress.fromJson(c.json.decode(json));
      } else {
        return ViolatorAddress.fromJson(json);
      }
    } else {
      return null;
    }
  }
  
}
