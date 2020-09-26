import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

typedef Widget IconBuilder(Color color, double width, double height);

abstract class ProjectIcons {
  static Widget calendarIcon({
    Color color,
    double width = 17.7,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Calendar.svg')(color, width, height);

  static Widget themeIcon({
    Color color,
    double width = 20.0,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Theme.svg')(color, width, height);

  static Widget mapIcon({
    Color color,
    double width = 20.0,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Map.svg')(color, width, height);

  static Widget viewIcon({
    Color color,
    double width = 20.0,
    double height = 15.0,
  }) =>
      _buildIcon('icons/Icon/View.svg')(color, width, height);

  static Widget deleteIcon({
    Color color,
    double width = 20.0,
    double height = 15.0,
  }) =>
      _buildIcon('icons/Icon/Delete.svg')(color, width, height);

  static Widget inspectorIcon({
    Color color,
    double width = 16.0,
    double height = 16.0,
  }) =>
      _buildIcon('icons/Icon/Inspector.svg')(color, width, height);

  static Widget inspector2Icon({
    Color color,
    double width = 20.0,
    double height = 15.0,
  }) =>
      _buildIcon('icons/Icon/Inspector2.svg')(color, width, height);

  static Widget pointIcon({
    Color color,
    double width = 12.0,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Point.svg')(color, width, height);

  static Widget exitIcon({
    Color color,
    double width = 18.0,
    double height = 18.0,
  }) =>
      _buildIcon('icons/Icon/Exit.svg')(color, width, height);

  static Widget raportIcon({
    Color color,
    double width = 18.75,
    double height = 18.0,
  }) =>
      _buildIcon('icons/Icon/Raport.svg')(color, width, height);

  static Widget addIcon({
    Color color,
    double width = 20.0,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Add.svg')(color, width, height);

  static Widget refreshIcon({
    Color color,
    double width = 18.0,
    double height = 18.0,
  }) =>
      _buildIcon('icons/Icon/Refresh.svg')(color, width, height);

  static Widget mailIcon({
    Color color,
    double width = 22.5,
    double height = 18.0,
  }) =>
      _buildIcon('icons/Icon/Mail.svg')(color, width, height);

  static Widget copyIcon({
    Color color,
    double width = 18.0,
    double height = 20.84,
  }) =>
      _buildIcon('icons/Icon/Copy.svg')(color, width, height);

  static Widget microphoneIcon({
    Color color,
    double width = 14.74,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Microphone.svg')(color, width, height);

  static Widget editIcon({
    Color color,
    double width = 18.0,
    double height = 18.0,
  }) =>
      _buildIcon('icons/Icon/Edit.svg')(color, width, height);

  static Widget cameraIcon({
    Color color,
    double width = 18.0,
    double height = 12.0,
  }) =>
      _buildIcon('icons/Icon/Camera-1.svg')(color, width, height);

  static Widget alertIcon({
    Color color,
    double width = 20.0,
    double height = 17.27,
  }) =>
      _buildIcon('icons/Icon/Alert.svg')(color, width, height);

  static Widget mapCloseIcon({
    Color color,
    double width = 18.0,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Map_close.svg')(color, width, height);

  static Widget camera2Icon({
    Color color,
    double width = 36.0,
    double height = 32.4,
  }) =>
      _buildIcon('icons/Icon/Camera.svg')(color, width, height);

  static Widget listIcon({
    Color color,
    double width = 28.2,
    double height = 36,
  }) =>
      _buildIcon('icons/Menu_icon/List.svg')(color, width, height);

  static Widget map2Icon({
    Color color,
    double width = 36.0,
    double height = 36.0,
  }) =>
      _buildIcon('icons/Menu_icon/Map.svg')(color, width, height);

  static Widget profileIcon({
    Color color,
    double width = 36.0,
    double height = 36.0,
  }) =>
      _buildIcon('icons/Menu_icon/Profile.svg')(color, width, height);

  static Widget vkIcon({
    Color color,
    double width = 41.45,
    double height = 36,
  }) =>
      _buildIcon('icons/Menu_icon/VK.svg')(color, width, height);

  static IconBuilder _buildIcon(String path) {
    return (Color color, double width, double height) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 5),
        child: SvgPicture.asset(
          path,
          width: width,
          height: height,
        ),
      );
    };
  }
}
