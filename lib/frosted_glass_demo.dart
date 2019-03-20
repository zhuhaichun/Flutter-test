import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List();
    //约束盒子，能够添加额外的约束到child上如设置最大最小宽高
    ConstrainedBox constrainedBox = ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Image.network('https://ps.ssl.qhimg.com/sdmt/179_135_100/t0100714605ba9621e2.jpg'),
    );
    Opacity opacity = Opacity(
      opacity: 0.5,
      child: Container(
        width: 500.0,
        height: 700.0,
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: Center(
          child: Text('Flutter',style: Theme.of(context).textTheme.display3,),
        ),
      ),
    );
    Center center = Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),//ImageFilter.blur 是模糊处理的过滤器
          child: opacity
        ),
      ),
    );
    widgets..add(constrainedBox)..add(center);
    return Scaffold(
      appBar: AppBar(
        title: Text('Frosted_glass_demo'),
      ),
      body: Stack(
        children: widgets,
      ),
    );
  }
}
