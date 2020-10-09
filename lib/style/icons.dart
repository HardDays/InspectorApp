import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inspector/style/colors.dart';

typedef Widget IconBuilder(Color color, double width, double height);

abstract class ProjectIcons {
  static Widget calendarIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 17.7,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Calendar.svg')(color, width, height);

  static Widget themeIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 20.0,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Theme.svg')(color, width, height);

  static Widget thumbUpIcon({
    Color color,
    double width = 22.0,
    double height = 20.0,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Icon/ThumbUp.svg', padding: padding)(color, width, height);

   static Widget thumbDownIcon({
    Color color,
    double width = 22.0,
    double height = 20.0,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Icon/ThumbDown.svg', padding: padding)(color, width, height);

   static Widget pinIcon({
    Color color,
    double width = 14.0,
    double height = 20.0,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Icon/Pin.svg', padding: padding)(color, width, height);

  static Widget mapIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 20.0,
    double height = 20.0,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Icon/Map.svg', padding: padding)(color, width, height);

  static Widget viewIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 20.0,
    double height = 15.0,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Icon/View.svg', padding: padding)(color, width, height);

  static Widget deleteIcon({
    Color color = ProjectColors.darkBlue,
    double width = 20.0,
    double height = 15.0,
  }) =>
      _buildIcon('icons/Icon/Delete.svg')(color, width, height);

  static Widget inspectorIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 16.0,
    double height = 16.0,
  }) =>
      _buildIcon('icons/Icon/Inspector.svg', padding: const EdgeInsets.only(left: 2, right: 2))(color, width, height);

  static Widget inspector2Icon({
    Color color = ProjectColors.mediumBlue,
    double width = 20.0,
    double height = 15.0,
  }) =>
      _buildIcon('icons/Icon/Inspector2.svg', padding: const EdgeInsets.only(left: 1, right: 1, top: 1))(color, width, height);

  static Widget pointIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 12.0,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Point.svg', padding: const EdgeInsets.only(left: 5, right: 3))(color, width, height);

  static Widget exitIcon({
    Color color = ProjectColors.darkBlue,
    double width = 18.0,
    double height = 18.0,
  }) =>
      _buildIcon('icons/Icon/Exit.svg')(color, width, height);

  static Widget raportIcon({
    Color color = ProjectColors.darkBlue,
    double width = 18.75,
    double height = 18.0,
  }) =>
      _buildIcon('icons/Icon/Raport.svg')(color, width, height);

  static Widget addIcon({
    Color color = ProjectColors.green,
    double width = 20.0,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Add.svg')(color, width, height);

  static Widget refreshIcon({
    Color color = ProjectColors.darkBlue,
    double width = 18.0,
    double height = 18.0,
  }) =>
      _buildIcon('icons/Icon/Refresh.svg')(color, width, height);

  static Widget mailIcon({
    Color color = ProjectColors.darkBlue,
    double width = 22.5,
    double height = 18.0,
  }) =>
      _buildIcon('icons/Icon/Mail.svg')(color, width, height);

  static Widget copyIcon({
    Color color = ProjectColors.darkBlue,
    double width = 18.0,
    double height = 20.84,
  }) =>
      _buildIcon('icons/Icon/Copy.svg')(color, width, height);

  static Widget microphoneIcon({
    Color color = ProjectColors.darkBlue,
    double width = 14.74,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Microphone.svg')(color, width, height);

  static Widget editIcon({
    Color color = ProjectColors.darkBlue,
    double width = 18.0,
    double height = 18.0,
  }) =>
      _buildIcon('icons/Icon/Edit.svg')(color, width, height);

  static Widget cameraIcon({
    Color color = ProjectColors.darkBlue,
    double width = 18.0,
    double height = 12.0,
  }) =>
      _buildIcon('icons/Icon/Camera-1.svg')(color, width, height);

  static Widget alertIcon({
    Color color = ProjectColors.red,
    double width = 20.0,
    double height = 17.27,
  }) =>
      _buildIcon('icons/Icon/Alert.svg')(color, width, height);

  static Widget mapCloseIcon({
    Color color = ProjectColors.red,
    double width = 18.0,
    double height = 20.0,
  }) =>
      _buildIcon('icons/Icon/Map_close.svg')(color, width, height);

  static Widget camera2Icon({
    Color color = ProjectColors.darkBlue,
    double width = 36.0,
    double height = 32.4,
  }) =>
      _buildIcon('icons/Icon/Camera.svg')(color, width, height);

  static Widget listIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 28.2,
    double height = 36,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Menu_icon/List.svg', padding: padding)(color, width, height);

  static Widget map2Icon({
    Color color = ProjectColors.mediumBlue,
    double width = 36.0,
    double height = 36.0,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Menu_icon/Map.svg', padding: padding)(color, width, height);

  static Widget profileIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 36.0,
    double height = 36.0,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Menu_icon/Profile.svg', padding: padding)(color, width, height);

  static Widget vkIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 41.45,
    double height = 36,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Menu_icon/VK.svg', padding: padding)(color, width, height);

   static Widget sortIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 20,
    double height = 18,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Top_menu_icon/Sort.svg', padding: padding)(color, width, height);

   static Widget filterIcon({
    Color color = ProjectColors.mediumBlue,
    double width = 22,
    double height = 15,
    EdgeInsets padding = EdgeInsets.zero
  }) =>
      _buildIcon('icons/Top_menu_icon/Filter.svg', padding: padding)(color, width, height);

  static IconBuilder _buildIcon(String path, {EdgeInsets padding = EdgeInsets.zero}) {
    return (Color color, double width, double height) {
      return Padding(
        padding: padding,
        child: SvgPicture.asset(
          path,
          color: color,
          width: width,
          height: height,
        ),
      );
    };
  }
}
