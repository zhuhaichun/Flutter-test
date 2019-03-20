import 'package:flutter/material.dart';

import 'draggable_widget.dart';

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Color _color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: Offset(80.0, 150.0),
            color: Colors.pinkAccent,
          ),
          DraggableWidget(
            offset: Offset(190.0, 150.0),
            color: Colors.green,
          ),
          Center(
            child: DragTarget(onAccept: (Color color) {
              _color = color;
            }, builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200.0,
                height: 200.0,
                color: _color,
              );
            }),
          )
        ],
      ),
    );
  }
}
