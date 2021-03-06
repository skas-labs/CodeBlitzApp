import 'package:code_blitz/presentation/custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class MyColors {
  //https://gist.github.com/lopspower/03fb1cc0ac9f32ef38f4

  static final HexColor PRIMARY = HexColor("0F0F20");
  static final HexColor WHITE = HexColor("FFFFFF");
  static final HexColor YELLOW = HexColor("F5E555");
  static final HexColor GREY = HexColor("999999");
  static final HexColor GREY_DARK = HexColor("666666");
  static final HexColor BLUE = HexColor("2AB5ED");

  static final HexColor EMBOSS_BLACK = HexColor("0F0F20");
  static final HexColor SHADOW_DARK = HexColor("1E1E2D");
  static final HexColor SHADOW_LIGHT = HexColor("03030B");

  static final HexColor DIVIDER = HexColor("22223A");

  //Gradients
  static final HexColor GRADIENT_PRIMARY_START = HexColor("F8501C");
  static final HexColor GRADIENT_PRIMARY_END = HexColor("FFAB1D");

  static final HexColor GRADIENT_SECONDARY_START = HexColor("44CFF0");
  static final HexColor GRADIENT_SECONDARY_END = HexColor("3976ED");

  static final HexColor GRADIENT_RED_START = HexColor("DF28A9");
  static final HexColor GRADIENT_RED_END = HexColor("FC6159");

  static final HexColor GRADIENT_BLUE_START = HexColor("09FFC4");
  static final HexColor GRADIENT_BLUE_END = HexColor("0B88FB");

  static final LinearGradient GRADIENT_PRIMARY = LinearGradient(
    begin: const Alignment(1, -1),
    end: const Alignment(-1, 2),
    // ignore: prefer_const_literals_to_create_immutables
    stops: [0.2, 1],
    colors: [GRADIENT_PRIMARY_START, GRADIENT_PRIMARY_END],
  );

  static final LinearGradient text = LinearGradient(
    begin: const Alignment(1, -1),
    end: const Alignment(-1, 1),
    colors: [
      HexColor("FE1E1E"),
      HexColor("EF954B"),
    ],
  );

  static final LinearGradient GRADIENT_SECONDARY = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [GRADIENT_SECONDARY_END, GRADIENT_SECONDARY_START],
  );

  static final LinearGradient GRADIENT_RED = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [GRADIENT_RED_END, GRADIENT_RED_START],
  );

  static final LinearGradient GRADIENT_BLUE = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [GRADIENT_BLUE_END, GRADIENT_BLUE_START],
  );
}
