import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ExpansionTile(
        leading: Icon(Icons.widgets),
        title: Text('this is a expansionTile'),
        backgroundColor: Colors.black12,
        children: <Widget>[
          ListTile(
            title: Text('this is title'),
            subtitle: Text('this is subtitle'),
          )
        ],
      ),
    );
  }
}
