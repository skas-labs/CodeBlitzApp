import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicCustomButton extends StatelessWidget {
  final Widget _child;
  final EdgeInsets _insets;
  final Function _onPress;

  const NeumorphicCustomButton({
    @required Widget child,
    @required Function onPress,
    EdgeInsets insets = const EdgeInsets.all(0),
  })  : _child = child,
        _onPress = onPress,
        _insets = insets;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(0),
      margin: _insets,
      style: NeumorphicStyle(
        depth: -4,
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
      onPressed: () {
        _onPress();
      },
      child: _child,
    );
  }
}

// NeumorphicButton
// (
// style: NeumorphicStyle
// (
// depth: -
// 4
// ,
// color: COLOR_CONST.PRIMARY,lightSource: LightSource
//     .topLeft,shadowDarkColor: COLOR_CONST
//     .SHADOW_DARK,shadowLightColor: COLOR_CONST
//     .SHADOW_LIGHT,shadowDarkColorEmboss: COLOR_CONST
//     .SHADOW_DARK,shadowLightColorEmboss: COLOR_CONST
//     .SHADOW_LIGHT,intensity: 0.90
// ,
// boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(10
// )
// )
// )
// ,
// )
// ,
// pressed: true
// ,
// onPressed: () {
// final snackBar = SnackBar(
// content: const Text('Yay! A SnackBar!'),
// action: SnackBarAction(
// label: 'Undo',
// onPressed: () {
// // Some code to undo the change.
// },
// ),
// );
// Scaffold.of(context).showSnackBar(snackBar);
// },
// child: Text
// ("follow
// "
// ,
// textAlign: TextAlign.center,style: FONT_CONST.BOLD_WHITE_18),
// )
// ,
