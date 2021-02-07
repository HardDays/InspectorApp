import 'package:json_annotation/json_annotation.dart';

part 'dcphoto.g.dart';

@JsonSerializable()
class DCPhoto {
  final int id;
  final String name;
  final String data;
  final String loadDate;
  final int geometryX;
  final int geometryY;

  DCPhoto({
    this.id,
    this.name,
    this.data,
    this.loadDate,
    this.geometryX,
    this.geometryY,
  });

  factory DCPhoto.fromJson(Map<String, dynamic> json) =>
      _$DCPhotoFromJson(json);
  Map<String, dynamic> toJson() => _$DCPhotoToJson(this);
}