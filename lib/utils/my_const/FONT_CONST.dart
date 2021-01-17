import 'package:flutter/material.dart';

import 'COLOR_CONST.dart';

class FONT_CONST {
  static final REGULAR = TextStyle(
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w400,
  );

  static final MEDIUM = TextStyle(
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );

  static final SEMIBOLD = TextStyle(
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  );

  static final BOLD = TextStyle(
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w800,
  );

  //REGULAR
  static final REGULAR_WHITE = REGULAR.copyWith(color: COLOR_CONST.WHITE);
  static final REGULAR_WHITE_8 = REGULAR_WHITE.copyWith(fontSize: 8);
  static final REGULAR_WHITE_10 = REGULAR_WHITE.copyWith(fontSize: 10);
  static final REGULAR_WHITE_12 = REGULAR_WHITE.copyWith(fontSize: 12);
  static final REGULAR_WHITE_14 = REGULAR_WHITE.copyWith(fontSize: 14);

  //MEDIUM
  static final MEDIUM_WHITE = MEDIUM.copyWith(color: COLOR_CONST.WHITE);
  static final MEDIUM_WHITE_12 = MEDIUM_WHITE.copyWith(fontSize: 12);
  static final MEDIUM_WHITE_14 = MEDIUM_WHITE.copyWith(fontSize: 14);
  static final MEDIUM_WHITE_16 = MEDIUM_WHITE.copyWith(fontSize: 16);
  static final MEDIUM_WHITE_22 = MEDIUM_WHITE.copyWith(fontSize: 22);

  //SEMI_BOLD
  static final SEMIBOLD_WHITE = SEMIBOLD.copyWith(color: COLOR_CONST.WHITE);
  static final SEMIBOLD_WHITE_10 = SEMIBOLD_WHITE.copyWith(fontSize: 10);
  static final SEMIBOLD_WHITE_16 = SEMIBOLD_WHITE.copyWith(fontSize: 16);
  static final SEMIBOLD_WHITE_18 = SEMIBOLD_WHITE.copyWith(fontSize: 18);

  //BOLD
  static final BOLD_WHITE = BOLD.copyWith(color: COLOR_CONST.WHITE);
  static final BOLD_WHITE_12 = BOLD_WHITE.copyWith(fontSize: 12);
  static final BOLD_WHITE_14 = BOLD_WHITE.copyWith(fontSize: 14);
  static final BOLD_WHITE_16 = BOLD_WHITE.copyWith(fontSize: 16);
  static final BOLD_WHITE_20 = BOLD_WHITE.copyWith(fontSize: 20);
}
