import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget _child;
  final EdgeInsets _insets;
  final bool isFlat;
  final LightSource lightSource;

  const NeumorphicContainer({
    @required Widget child,
    EdgeInsets insets = const EdgeInsets.all(0),
    this.isFlat = true,
    this.lightSource = LightSource.topLeft
  })  : _child = child,
        _insets = insets;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        margin: _insets,
        style: NeumorphicStyle(
          depth: isFlat ? 3 : -4,
          color: MyColors.PRIMARY,
          lightSource: lightSource,
          shadowDarkColor: MyColors.SHADOW_DARK,
          shadowLightColor: MyColors.SHADOW_LIGHT,
          shadowDarkColorEmboss: MyColors.SHADOW_DARK,
          shadowLightColorEmboss: MyColors.SHADOW_LIGHT,
          intensity: 0.90,
          boxShape: NeumorphicBoxShape.roundRect(
              const BorderRadius.all(Radius.circular(10))),
        ),
        child: _child);
  }
}
