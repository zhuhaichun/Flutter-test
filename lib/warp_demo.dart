import 'package:flutter/material.dart';

class WarpDemo extends StatefulWidget {
  @override
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  List<Widget> list;

  @override
  void initState() {
    list = List<Widget>()..add(buildAddButton());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
//      appBar: AppBar(
//        title: Text('WarpDemo'),
//      ),
      body: Center(
        child: Container(
          width: width,
          height: height / 2,
          decoration: BoxDecoration(color: Colors.black45),
          child: Opacity(
            opacity: 0.3,
            child: Wrap(
              spacing: 26.0,
              children: list,
            ),
          ),
        ),
      )
    );
  }

  Widget buildAddButton() {
    Widget addButton = GestureDetector(
      onTap: () {
        if (list.length < 9) {
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black.withOpacity(0.6),
          child: Icon(Icons.add),
        ),
      ),
    );
    return addButton;
  }

  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.lime,
        child:Center(
          child:  Text('照片'),
        ),
      ),
    );
  }
}
