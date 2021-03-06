import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/content/explore/feed_content.dart';
import 'package:flutter_ecommerce/src/content/explore/trends_content.dart';
import 'package:flutter_ecommerce/src/widgets/components/search.dart';
import 'package:flutter_ecommerce/src/widgets/components/side_drawer.dart';

class ExploreScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExploreScreenSate();
  }
}

class _ExploreScreenSate extends State<ExploreScreen> {
  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: sideDrawer(context),
          appBar: AppBar(
            centerTitle: true,
            title: _showSearch ? searchInput(context) : Text('EXPLORE'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Trends',
                ),
                Tab(
                  text: 'Feed',
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: _showSearch ? Icon(Icons.close) : Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _showSearch = _showSearch ? false : true;
                  });
                },
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              TrendsContent(),
              FeedsContent(),
            ],
          ),
        ),
      ),
    );
  }
}
