import 'package:code_blitz/utils/my_const/COLOR_CONST.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final bool _hasMargin;
  final double height;

  CustomDivider({bool hasMargin = false, this.height = 2}) : this._hasMargin = hasMargin;

  @override
  Widget build(BuildContext context) {
    double indent = _hasMargin? 0 : 30;
    return Divider(
      color: Colors.transparent,
      height: height,
      indent: indent,
      endIndent: indent,
    );
  }
}
