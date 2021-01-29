import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
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

    return NeumorphicContainer(
      // decoration: BoxDecoration(
      //   boxShadow: <BoxShadow>[
      //     BoxShadow(
      //       color: Colors.black,
      //       blurRadius: 10,
      //     ),
      //   ],
      // ),
      child: BottomAppBar(
        color: COLOR_CONST.PRIMARY,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(
              index: 0,
              icon: Icon(Icons.search),
            ),
            buildTabItem(
              index: 1,
              icon: Icon(Icons.mail_outline),
            ),
            placeholder,
            buildTabItem(
              index: 2,
              icon: Icon(Icons.account_circle),
            ),
            buildTabItem(
              index: 3,
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabItem({
    @required int index,
    @required Icon icon,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Colors.red : Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
        child: IconButton(
          iconSize: 30,
          icon: icon,
          onPressed: () => widget.onChangedTab(index),
        ),
      ),
    );
  }
}
