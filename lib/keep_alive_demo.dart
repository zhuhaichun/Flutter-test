import 'package:flutter/material.dart';
import 'search_bar_delegate.dart';
import 'warp_demo.dart';
import 'expansion_tile_demo.dart';
import 'expansion_panel_list.dart';
import 'custom_clipper.dart';
import 'draggable_demo.dart';

class KeepAliveDemo extends StatefulWidget {
  @override
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: AppBar(
        title: Text('Keep Alive Demo'),
        bottom: TabBar(
          tabs: <Icon>[
            Icon(Icons.details),
            Icon(Icons.android),
            Icon(Icons.opacity),
            Icon(Icons.list),
            Icon(Icons.map),
            Icon(Icons.adb),
            Icon(Icons.add_to_photos)
          ],
          controller: _controller,
          unselectedLabelColor: Colors.grey,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: SearchBarDelegate());
          })
        ],
      ), preferredSize: Size.fromHeight(100.0)),
      body: TabBarView(
        children: <Widget>[
          WarpDemo(),
          MyHomePage(),
          MyHomePage(),
          ExpansionTileDemo(),
          ExpansionPanelListDemo(),
          CustomClipperDemo(),
          DraggableDemo()
        ],
        controller: _controller,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '点击加1',
                style: Theme.of(context).textTheme.display1,
              ),
              Text('$_counter')
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
        tooltip: 'incrememt',
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
