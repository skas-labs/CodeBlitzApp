import 'package:code_blitz/utils/my_const/COLOR_CONST.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: COLOR_CONST.DIVIDER,
      height: 1,
      thickness: 2,
      indent: 30,
      endIndent: 30,
    );
  }
}
