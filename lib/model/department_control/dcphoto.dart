import 'package:freezed_annotation/freezed_annotation.dart';

part 'dcphoto.g.dart';
part 'dcphoto.freezed.dart';

@freezed
abstract class DCPhoto with _$DCPhoto {

  const factory DCPhoto({
    int id,
    String name,
    String data,
    String loadDate,
    double geometryX,
    double geometryY,
  }) = _DCPhoto;

  factory DCPhoto.fromJson(Map<String, dynamic> json) =>
      _$DCPhotoFromJson(json);

}