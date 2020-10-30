import 'package:flutter/foundation.dart';
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
    @required this.cladrCode,
    @required this.zipCode,
    @required this.subjectCode,
    @required this.subjectName,
    @required this.subjectType,
    @required this.regionName,
    @required this.regionType,
    @required this.cityName,
    @required this.cityType,
    @required this.placeName,
    @required this.placeType,
    @required this.streetName,
    @required this.streetType,
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

  @override 
  String toString() {
    final data = [zipCode, regionType, regionName, cityType, cityName, streetType, streetName, house, building, buildingExt, flat];
    return data.where((e)=> e != null && e.isNotEmpty).join(', ');
  }

  static ViolatorAddress parse(dynamic json, bool stringified) {
    if (json != null) {
      if (stringified) {
        return ViolatorAddress.fromJson(c.json.decode(json));
      } else {
        return ViolatorAddress.fromJson(json);
      }
    }
  }
  
}
