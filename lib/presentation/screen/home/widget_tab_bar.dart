import 'package:code_blitz/utils/my_const/COLOR_CONST.dart';
import 'package:flutter/material.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarMaterialWidget({
    @required this.index,
    @required this.onChangedTab,
    Key key,
  }) : super(key: key);

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomAppBar(
        color: MyColors.PRIMARY,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(
              index: 0,
              icon: Image.asset("images/ic_home.png"),
            ),
            buildTabItem(
              index: 1,
              icon: Image.asset("images/ic_leaderboard.png"),
            ),
            placeholder,
            buildTabItem(
              index: 2,
              icon: Image.asset("images/ic_profile.png"),
            ),
            buildTabItem(
              index: 3,
              icon: Image.asset("images/ic_friends.png"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabItem({
    @required int index,
    @required Image icon,
  }) {
    final isSelected = index == widget.index;

    return Wrap(children: [
      Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            iconSize: 30,
            icon: icon,
            onPressed: () => widget.onChangedTab(index),
          ),
        ),
        isSelected
            ? SizedBox(
                width: 20,
                height: 3,
                child: Container(
                    decoration: BoxDecoration(
                        gradient: MyColors.GRADIENT_PRIMARY)))
            : SizedBox(),
      ]),
    ]);
  }
}
