import 'dart:ui';

import 'package:flutter/material.dart';

class CustomPaintPage extends StatefulWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  @override
  State<CustomPaintPage> createState() => _CustomPaintPageState();
}

class _CustomPaintPageState extends State<CustomPaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomPaint'),),
      body: Center(
        child: Column(
          children: [
            CustomPaint(
              painter: MyPainter(),
              size: const Size(100,100),
            ),
            CustomPaint(
              painter: MyPainter2(),
              size: const Size(100,100),
            )
          ],
        ),
      ),
    );
  }
}


class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    Paint _paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5;
    //绘制动画
    //画点
    var points = [
      Offset(0, 0),
      Offset(size.width / 2, size.height / 2),
      Offset(size.width, size.height),
    ];
    canvas.drawPoints(PointMode.points, points, _paint);
    //画线
    //canvas.drawLine(Offset(1, 1),Offset(size.width, size.height) , _paint);
  }
  @override
  bool shouldRepaint(MyPainter oldDelegate){
    //shouldRepaint方法通常在当前实例和旧实例属性不一致时返回true
    return this != oldDelegate;
  }
}

class MyPainter2 extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    Paint _paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5;
    //画线
    canvas.drawLine(Offset(1, 1),Offset(size.width, size.height) , _paint);
  }
  @override
  bool shouldRepaint(MyPainter oldDelegate){
    //shouldRepaint方法通常在当前实例和旧实例属性不一致时返回true
    return this != oldDelegate;
  }
}


