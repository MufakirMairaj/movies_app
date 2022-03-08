import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

mixin TextStyles {
  static TextStyle get title => GoogleFonts.montserrat(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 22,
      );

  static TextStyle get appBarTitle => GoogleFonts.montserrat(
        color: AppColors.black,
        fontSize: 18,
      );

  static TextStyle get subtitle  => GoogleFonts.montserrat(
    color: AppColors.white,
    fontSize: 18,
  );

  static TextStyle get desc  => GoogleFonts.montserrat(
    color: AppColors.lightBlack,
    fontSize: 20,
  );


}
