import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String avatarUrl;
  final String displayName;
  final String username;
  final double points;
  final EdgeInsets insets;

  const UserItem({
    Key key,
    @required this.avatarUrl,
    @required this.displayName,
    @required this.username,
    this.points,
    this.insets = const EdgeInsets.all(30),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: insets,
        child: Row(
          children: [
            CircleAvatar(radius: 40, backgroundImage: NetworkImage(avatarUrl)),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UnicornText(
                    text: displayName,
                    style: FONT_CONST.EXTRABOLD_WHITE_20,
                    gradient: COLOR_CONST.GRADIENT_PRIMARY,
                    overflow: TextOverflow.ellipsis,
                    align: TextAlign.center,
                    maxLines: 1,
                  ),
                  Text(
                    "@$username • 700 CR",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FONT_CONST.BOLD_WHITE_16
                        .copyWith(color: COLOR_CONST.YELLOW),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
