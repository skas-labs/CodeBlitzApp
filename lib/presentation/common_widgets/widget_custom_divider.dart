import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: const Color.fromRGBO(243, 243, 243, 1),
      height: 1,
      thickness: 2,
      indent: 30,
      endIndent: 30,
    );
  }
}
