import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ProjectTextStyles {
  static final title = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 24.0/18.0,
    ),
  );

  static final subTitle = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 22.0/16.0,
    ),
  );

  static final base = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 18.0/14.0,
    ),
  );

  static final baseBold = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 18.0/14.0,
    ),
  );

  static final medium = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      height: 18.0/13.0,
    ),
  );

  static final mediumBold = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 24.0/18.0,
    ),
  );

  static final small = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 14.0/12.0,
    ),
  );

    static final smallAction = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 11,
      height: 13.0/11.0,
    ),
  );


  static final smallBold = GoogleFonts.montserrat(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: 16.0/12.0,
    ),
  );
}
