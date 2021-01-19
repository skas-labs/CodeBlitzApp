import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget _child;
  final EdgeInsets _insets;

  NeumorphicContainer({
    @required Widget child,
    EdgeInsets insets = const EdgeInsets.all(0),
  })  : this._child = child,
        this._insets = insets;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        margin: _insets,
        style: NeumorphicStyle(
          depth: -5,
          color: COLOR_CONST.PRIMARY,
          shape: NeumorphicShape.convex,
          lightSource: LightSource.bottomRight,
          shadowDarkColorEmboss: COLOR_CONST.SHADOW_DARK,
          shadowLightColorEmboss: COLOR_CONST.SHADOW_LIGHT,
          intensity: 0.60,
          boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.all(Radius.circular(5))),
        ),
        child: _child);
  }
}
