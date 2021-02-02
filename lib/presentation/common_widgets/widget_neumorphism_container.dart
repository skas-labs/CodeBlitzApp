import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget _child;
  final EdgeInsets _insets;

  const NeumorphicContainer({
    @required Widget child,
    EdgeInsets insets = const EdgeInsets.all(0),
  })  : _child = child,
        _insets = insets;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        margin: _insets,
        style: NeumorphicStyle(
          depth: -20,
          color: COLOR_CONST.PRIMARY,
          shape: NeumorphicShape.convex,
          lightSource: LightSource.topLeft,
          shadowDarkColor: COLOR_CONST.SHADOW_DARK,
          shadowLightColor: COLOR_CONST.SHADOW_LIGHT,
          shadowDarkColorEmboss: COLOR_CONST.SHADOW_DARK,
          shadowLightColorEmboss: COLOR_CONST.SHADOW_LIGHT,
          intensity: 0.90,
          boxShape: NeumorphicBoxShape.roundRect(
              const BorderRadius.all(Radius.circular(10))),
        ),
        child: _child);
  }
}
