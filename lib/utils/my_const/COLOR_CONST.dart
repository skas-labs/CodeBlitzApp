import 'package:code_blitz/presentation/custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

class COLOR_CONST {
  //https://gist.github.com/lopspower/03fb1cc0ac9f32ef38f4

  static final HexColor PRIMARY = new HexColor("0F0F20");

  static final HexColor WHITE = new HexColor("FFFFFF");
  static final HexColor YELLOW = new HexColor("F5E555");
  static final HexColor GREY = new HexColor("999999");

  static final HexColor EMBOSS_BLACK = new HexColor("0F0F20");
  static final HexColor SHADOW_DARK = new HexColor("24242E");
  static final HexColor SHADOW_LIGHT = new HexColor("03030A");



  static final HexColor DIVIDER = new HexColor("22223A");

  //Gradients
  static final HexColor GRADIENT_PRIMARY_START = new HexColor("F8501C");
  static final HexColor GRADIENT_PRIMARY_END = new HexColor("FFAB1D");

  static final HexColor GRADIENT_SECONDARY_START = new HexColor("44CFF0");
  static final HexColor GRADIENT_SECONDARY_END = new HexColor("3976ED");

  static final HexColor GRADIENT_RED_START = new HexColor("DF28A9");
  static final HexColor GRADIENT_RED_END = new HexColor("FC6159");

  static final HexColor GRADIENT_BLUE_START = new HexColor("09FFC4");
  static final HexColor GRADIENT_BLUE_END = new HexColor("0B88FB");

  static final LinearGradient GRADIENT_PRIMARY = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      GRADIENT_PRIMARY_END,
      GRADIENT_PRIMARY_START
    ],
  );
  static final LinearGradient GRADIENT_SECONDARY = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      GRADIENT_SECONDARY_END,
      GRADIENT_SECONDARY_START
    ],
  );

  static final LinearGradient GRADIENT_RED = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      GRADIENT_RED_END,
      GRADIENT_RED_START
    ],
  );

  static final LinearGradient GRADIENT_BLUE = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      GRADIENT_BLUE_END,
      GRADIENT_BLUE_START
    ],
  );
}
