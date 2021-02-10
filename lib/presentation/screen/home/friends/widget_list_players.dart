import 'package:code_blitz/model/api/response/api_response.dart';
import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/router.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetListPlayer extends StatelessWidget {
  List<ProfileResponse> items;

  WidgetListPlayer(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 24),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: items.map(
        (item) {
          return _WidgetItemPlayer(item);
        },
      ).toList(),
    );
  }
}

class _WidgetItemPlayer extends StatelessWidget {
  final ProfileResponse item;

  const _WidgetItemPlayer(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openPlayerDetails(context, item.id);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30,15,30,15),
        child: Row(
          children: [
            const CircleAvatar(
                radius: 35, backgroundImage: NetworkImage("avatarUrl")),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UnicornText(
                    text: item.name,
                    style: MyFonts.extraBold_20,
                    gradient: MyColors.GRADIENT_PRIMARY,
                    overflow: TextOverflow.ellipsis,
                    align: TextAlign.center,
                    maxLines: 1,
                  ),
                  Text(
                    "@${item.username} • 700 CR",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: MyFonts.bold_16,
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

  void openPlayerDetails(BuildContext context, int id) {
    Navigator.pushNamed(context, AppRouter.PLAYER, arguments: id);
  }
}
