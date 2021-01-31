import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/screen/home/profile/bloc.dart';
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

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {
        currentTabIndex = _controller.index;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
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

  Widget _buildContent(ProfileState state) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ProfileBloc>(context).add(RefreshProfile());
        },
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            NeumorphicContainer(
              insets: const EdgeInsets.only(
                  right: 30, left: 30, top: 15, bottom: 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                child: TextField(
                  keyboardType: TextInputType.name,
                  autocorrect: false,
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
      ),
    );
  }

  Expanded _buildList(ProfileState state) {
    if (state is ProfileNotLoaded) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is ProfileLoading) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is ProfileNotLoaded) {
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
              onTap: (index) {},
              labelColor: COLOR_CONST.WHITE,
              labelStyle: FONT_CONST.BOLD_WHITE_18,
              unselectedLabelStyle: FONT_CONST.MEDIUM_WHITE_18,
            ),
          ),
        ));
  }
}
