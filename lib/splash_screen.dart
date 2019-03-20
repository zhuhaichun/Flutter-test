import 'package:flutter/material.dart';

import 'keep_alive_demo.dart';

class SplashScreenDemo extends StatefulWidget {
  @override
  _SplashScreenDemoState createState() => _SplashScreenDemoState();
}

class _SplashScreenDemoState extends State<SplashScreenDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return KeepAliveDemo();
        }), (route) {
          return route == null;
        });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Image.network(
        'http://img17.3lian.com/d/file/201702/07/0164fc69ab02be6ce92d91175cd34b0c.jpeg',
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
