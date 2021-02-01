import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/custom_ui/custom_ui.dart';
import 'package:code_blitz/presentation/screen/home/friends/bloc.dart';
import 'package:code_blitz/presentation/screen/home/friends/widget_list_players.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int currentTabIndex = 0;

  FriendsBloc _friendsBloc;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _friendsBloc = BlocProvider.of<FriendsBloc>(context);
    _friendsBloc.add(OpenScreen());

    _searchController.addListener(onSearchQueryChanged);
    _controller = TabController(
      length: 2,
      vsync: this,
    );
    _controller.addListener(() {
      setState(() {
        currentTabIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendsBloc, FriendsState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                _buildContent(state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(FriendsState state) {
    return Expanded(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          NeumorphicContainer(
            insets:
                const EdgeInsets.only(right: 30, left: 30, top: 15, bottom: 20),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
              child: TextField(
                keyboardType: TextInputType.name,
                autocorrect: false,
                controller: _searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'search usernames, names',
                  hintStyle: FONT_CONST.MEDIUM_WHITE_16,
                  prefixIcon: Icon(
                    Icons.search,
                    color: COLOR_CONST.WHITE,
                  ),
                ),
                style: FONT_CONST.BOLD_WHITE_16,
              ),
            ),
          ),
          _buildTabs(),
          CustomDivider(),
          _buildList(state)
        ],
      ),
    );
  }

  Expanded _buildList(FriendsState state) {
    if (state is PlayersLoaded) {
      return Expanded(child: WidgetListPlayer(state.response));
    } else if (state is PlayersLoading) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is PlayersNotLoaded) {
      return const Expanded(
        child: Center(
          child: Text('Cannot load data'),
        ),
      );
    } else {
      return const Expanded(
        child: Center(
          child: Text('Unknown state'),
        ),
      );
    }
  }

  DefaultTabController _buildTabs() {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                isScrollable: true,
                controller: _controller,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: <Widget>[
                  const Tab(
                    text: 'followers',
                  ),
                  const Tab(
                    text: 'following',
                  ),
                ],
                onTap: (index) {
                  _searchController.text = "";
                  _friendsBloc.add(TabChanged(index: index));
                },
                labelColor: COLOR_CONST.WHITE,
                labelStyle: FONT_CONST.BOLD_WHITE_18,
                unselectedLabelStyle: FONT_CONST.MEDIUM_WHITE_18,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: RoundedRectIndicator(
                    color: COLOR_CONST.WHITE,
                    radius: 10,
                    padding: 0,
                    weight: 2.0)),
          ),
        ));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void onSearchQueryChanged() {
    _friendsBloc.add(SearchQueryChanged(keyword: _searchController.text));
  }
}
