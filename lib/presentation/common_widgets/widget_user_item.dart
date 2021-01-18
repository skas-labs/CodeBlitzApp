import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String avatarUrl;
  final String displayName;
  final String username;
  final double points;

  const UserItem({
    Key key,
    @required this.avatarUrl,
    @required this.displayName,
    @required this.username,
    this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 35, backgroundImage: NetworkImage(avatarUrl)),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FONT_CONST.BOLD_WHITE_20,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "@$username • 700 CR",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FONT_CONST.BOLD_WHITE_16,
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
