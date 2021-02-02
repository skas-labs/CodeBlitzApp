import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget _child;
  final EdgeInsets _insets;
  final bool isFlat;

  const NeumorphicContainer({
    @required Widget child,
    EdgeInsets insets = const EdgeInsets.all(0),
    this.isFlat = true,
  })  : _child = child,
        _insets = insets;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        margin: _insets,
        style: NeumorphicStyle(
          depth: isFlat ? 3 : -4,
          color: COLOR_CONST.PRIMARY,
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
