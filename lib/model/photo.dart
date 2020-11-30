import 'package:flutter/foundation.dart';

class Photo {
  final int id;
  final String name;
  final String data;
  
  Photo({
    this.id,
    this.name,
    this.data,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'], 
      name: json['name'], 
      data: json['data']
    );
  }
  
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'data': data
    };
  }
}