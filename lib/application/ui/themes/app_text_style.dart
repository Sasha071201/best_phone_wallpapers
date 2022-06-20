import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();

  static final _lato = GoogleFonts.lato();
  static final _raleway = GoogleFonts.raleway();
  static final _montserrat = GoogleFonts.montserrat();

  static final header = _lato.copyWith(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 25,
    height: 40 / 25,
    letterSpacing: 25 * 0.03
  );

  static final button = _lato.copyWith(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    height: 16.8 / 14,
    letterSpacing: 14 * 0.03
  );

  static final regularRaleway12 = _raleway.copyWith(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 12,
    height: 20 / 12,
    letterSpacing: 12 * 0.03
  );
  
  static final mediumMontserrat12 = _montserrat.copyWith(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 12,
    height: 14.63 / 12,
    letterSpacing: 12 * 0.03
  );

  static final mediumMontserrat14 = _montserrat.copyWith(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 14,
    height: 17.07 / 14,
  );

  static final boldMontserrat10 = _montserrat.copyWith(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 10,
    height: 12 / 10,
  );
}
