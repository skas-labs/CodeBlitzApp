import 'package:code_blitz/presentation/custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

class COLOR_CONST {
  //https://gist.github.com/lopspower/03fb1cc0ac9f32ef38f4

  static final HexColor PRIMARY = new HexColor("0F0F20");

  static final HexColor GRADIENT_PRIMARY_START = new HexColor("F8501C");
  static final HexColor GRADIENT_PRIMARY_END = new HexColor("FFAB1D");

  static final HexColor WHITE = new HexColor("FFFFFF");

  static final LinearGradient GRADIENT_PRIMARY = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      GRADIENT_PRIMARY_END,
      GRADIENT_PRIMARY_START
    ],
  );
}
