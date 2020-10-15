import 'dart:convert' as c;

import 'package:flutter/material.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/street.dart';

class Address {
  
  final int id;
  final double latitude;
  final double longitude;
  final String houseNum;
  final String buildNum;
  final String constructionNum;
  final String specifiedAddress;
  final String unom;
  final String unad;
  // final int areaId;
  // final int districtId;
  // final int streetId;
  final Area area;
  final District district;
  final Street street;

  Address({
    @required this.id,
    @required this.latitude,
    @required this.longitude,
    @required this.houseNum,
    @required this.buildNum,
    @required this.constructionNum,
    @required this.specifiedAddress,
    @required this.unom,
    @required this.unad,
    @required this.area,
    @required this.district,
    @required this.street,
    // @required this.areaId,
    // @required this.districtId,
    // @required this.streetId,
  });

  factory Address.fromJson(Map<String, dynamic> json, {bool stringified = false}) {
    // final area = json['area'] != null ? Area.fromJson(json['area']) : Area(id: json['areaId']);
    // final district = json['district'] != null ? District.fromJson(json['district']) : District(id: json['districtId']);
    // final street = json['street'] != null ? Street.fromJson(json['street']) : Street(id: json['streetId']);
    var t = 0;
    return Address(
      id: json['id'], 
      latitude: json['latitude'], 
      longitude: json['longitude'], 
      houseNum: json['houseNum'],
      buildNum: json['buildNum'],
      constructionNum: json['constructionNum'],
      specifiedAddress: json['specifiedAddress'],
      unom: json['unom'],
      unad: json['unad'],
      area:  Area.fromJson(stringified ? c.json.decode(json['area']) : json['area']),
      district: District.fromJson(stringified ? c.json.decode(json['district']) : json['district']),
      street: Street.fromJson(stringified ? c.json.decode(json['street']) : json['street']),
      // areaId: area.id,
      // districtId: district.id,
      // streetId: street.id
    );
  }

  Map<String, dynamic> toJson({bool stringified = false}) {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'houseNum': houseNum,
      'buildNum': buildNum,
      'constructionNum': constructionNum,
      'specifiedAddress': specifiedAddress,
      'unom': unom,
      'unad': unad,
      'area': stringified ? c.json.encode(area?.toJson()) : area?.toJson(),
      'district': stringified ? c.json.encode(district?.toJson()) : district?.toJson(),
      'street': stringified ? c.json.encode(street?.toJson()) : street?.toJson(),
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson(stringified: true);
  }

  @override
  String toString() {
    final data = [houseNum, buildNum != null ? 'к. $buildNum' : null, constructionNum != null ? 'стр. $constructionNum' : null];
    return data.where((element) => element != null).join(', ');
  }

  String toLongString() {
    final data = [area?.toString(), district?.toString(), street?.toString(), houseNum, buildNum != null ? 'к. $buildNum' : null, constructionNum != null ? 'стр. $constructionNum' : null];
    return data.where((element) => element != null).join(', ');
  }
}
