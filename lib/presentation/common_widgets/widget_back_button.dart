import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

import 'widget_neumorphism_container.dart';

class NeumorphicBackButton extends StatelessWidget {
  const NeumorphicBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          color: COLOR_CONST.WHITE,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
