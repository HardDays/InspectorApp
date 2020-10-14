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
  });

  factory Address.fromJson(Map<String, dynamic> json) {
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
      area: Area.fromJson(json['area']),
      district: District.fromJson(json['district']),
      street: Street.fromJson(json['street']),
    );
  }

  Map<String, dynamic> toJson() {
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
      'area': area.toJson(),
      'district': district.toJson(),
      'street': street.toJson(),
    };
  }

  String toShortString() {
    final data = [houseNum, buildNum != null ? 'к. $buildNum' : null, constructionNum != null ? 'стр. $constructionNum' : null];
    return data.where((element) => element != null).join(', ');
  }

  @override
  String toString() {
    final data = [area?.toString(), district?.toString(), street?.toString(), houseNum, buildNum != null ? 'к. $buildNum' : null, constructionNum != null ? 'стр. $constructionNum' : null];
    return data.where((element) => element != null).join(', ');
  }
}
