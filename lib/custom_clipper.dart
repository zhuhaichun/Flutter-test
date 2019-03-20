import 'package:flutter/material.dart';

class CustomClipperDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        ClipPath(
//          clipper: TopBezierClipper(),
//          child: Container(
//            height: 200.0,
//            color: Colors.green,
//          ),
//        )
//      ],
//    );
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottomBezierClipper(),
            child: Container(
              height: 200.0,
              color: Colors.green,
            ),
          )
        ],
      ),
      bottomSheet:ClipPath(
        clipper: TopBezierClipper(),
        child: Container(
          height: 150.0,
          color: Colors.pinkAccent,
        ),
      ),
    );
  }
}

class BottomBezierClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    int offset = 80;
    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height - offset);
    var controlPoint1 = Offset(size.width / 2, size.height);
    var controlPoint2 = Offset(size.width, size.height - offset);
    path.quadraticBezierTo(
        controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy);
    path.lineTo(size.width, size.height - offset);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class TopBezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 60.0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 80);
    var controlPoint1 = Offset(size.width * 0.75, 120);
    var controlPoint2 = Offset(size.width / 2, 60);
    path.quadraticBezierTo(
        controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy);
    controlPoint1 = Offset(size.width / 4, 0.0);
    controlPoint2 = Offset(0.0, 60.0);
    path.quadraticBezierTo(
        controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
