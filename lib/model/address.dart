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
  final int areaId;
  final int districtId;
  final int streetId;
  final Area area;
  final District district;
  final Street street;

  Address({
    this.id,
    this.latitude,
    this.longitude,
    this.houseNum,
    this.buildNum,
    this.constructionNum,
    this.specifiedAddress,
    this.unom,
    this.unad,
    this.area,
    this.district,
    this.street,
    this.areaId,
    this.districtId,
    this.streetId,
  });

  Address copyWith({
    int id,
    double latitude,
    double longitude,
    Area area,
    District district,
    Street street,
    String houseNum,
    String buildNum,
    String constructionNum,
    String specifiedAddress
  }) {
    return Address(
      id: id ?? this.id,
      latitude: latitude,
      longitude: longitude,
      houseNum: houseNum ?? this.houseNum,
      buildNum: buildNum ?? this.buildNum,
      constructionNum: constructionNum ?? this.constructionNum,
      specifiedAddress: specifiedAddress ?? this.specifiedAddress,
      unom: unom,
      unad: unad,
      area: area ?? this.area,
      district: district ?? this.district,
      street: street ?? this.street,
      areaId: areaId,
      streetId: streetId,
      districtId: districtId
    );
  }

  factory Address.fromJson(Map<String, dynamic> json, {bool stringified = false}) {
    final area = Area.fromJson(stringified ? c.json.decode(json['area']) : json['area']);
    final district = District.fromJson(stringified ? c.json.decode(json['district']) : json['district']);
    final street = Street.fromJson(stringified ? c.json.decode(json['street']) : json['street']);
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
      area: area,
      district: district,
      street: street,
      areaId: area?.id,
      districtId: district?.id,
      streetId: street?.id
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
      'areaId': areaId,
      'districtId': districtId,
      'streetId': streetId,
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

  String toSearchString() {
    final data = ['Москва', street?.toString(), houseNum, buildNum != null ? 'к. $buildNum' : null, constructionNum != null ? 'стр. $constructionNum' : null];
    return data.where((element) => element != null).join(', ');
  }
}
