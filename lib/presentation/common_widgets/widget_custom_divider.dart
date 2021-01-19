import 'package:code_blitz/utils/my_const/COLOR_CONST.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final bool _hasMargin;

  CustomDivider({bool hasMargin = false}) : this._hasMargin = hasMargin;

  @override
  Widget build(BuildContext context) {
    double indent = _hasMargin? 0 : 30;
    return Divider(
      color: COLOR_CONST.DIVIDER,
      height: 1,
      thickness: 2,
      indent: indent,
      endIndent: indent,
    );
  }
}
