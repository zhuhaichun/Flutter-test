import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color color;

  DraggableWidget({Key key, this.offset, this.color}) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    offset = widget.offset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var s = MediaQuery.of(context);
    //print('sdfksjkfjk$s');
    return Positioned(
      child: Draggable(
          data: widget.color,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.color,
          ),
          feedback: Container(
            width: 110.0,
            height: 110.0,
            color: widget.color.withOpacity(0.5),
          ),
          onDraggableCanceled: (velocity,offset){
            setState(() {
              this.offset = offset;
            });
          },
      ),
      left: offset.dx,
      top: offset.dy-125.0,
    );
  }
}
