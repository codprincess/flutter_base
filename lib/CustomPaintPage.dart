import 'dart:math';
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
      // backgroundColor: Colors.black26,
      appBar: AppBar(title: const Text('CustomPaint'),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            CustomPaint(
              painter: MyPainter(),
              size: const Size(200,200),
            ),
            // CustomPaint(
            //   painter: MyPainter2(),
            //   size: const Size(100,100),
            // ),
            // CustomPaint(
            //   painter: MyPainter3(),
            //   size: const Size(100,100),
            // )
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
      // ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    //绘制动画
    //画点
    var points = [
      Offset(0, 0),
      Offset(size.width / 2, size.height / 2),
      Offset(size.width, size.height),
    ];
    //画点
    //canvas.drawPoints(PointMode.points, points, _paint);
    //画线
    // canvas.drawLine(Offset(1, 1),Offset(size.width, size.height) , _paint);
    //画圆
    //canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, _paint);
    //画椭圆
    //canvas.drawOval(Rect.fromLTRB(0, 0, size.width, size.height/2), _paint);
    //绘制弧
    //canvas.drawArc(Rect.fromLTRB(0, 0, size.height,size.width), 0, pi/4, true, _paint);
    //绘制圆角矩形
    // canvas.drawRRect(rrect, paint)
    // canvas.drawRRect(RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(10)), _paint);
    // 画图像drawImage
    //画矩形drawRect
    //var rect = Rect.fromCenter(center: Offset(size.width/2,size.height/2), width: 100, height: 100);
   // var rect = Rect.fromLTRB(0, 0, size.width/2, size.height/2);
    //var rect = Rect.fromLTWH(0, 0,size.width/2, size.height/2);
    var rect = Rect.fromPoints(Offset(0, 0), Offset(size.width/2, size.height/2));

    canvas.drawRect(rect, _paint);

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

class MyPainter3 extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    Paint _paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    //路径一个三角形
    var _path = Path()
    ..moveTo(0, 0)
    ..lineTo(size.width, 0)
    ..lineTo(size.width, size.height)
   // ..lineTo(2*size.width, 2*size.height)
    ..close();
    canvas.drawPath(_path, _paint);
  }
  @override
  bool shouldRepaint(MyPainter oldDelegate){
    //shouldRepaint方法通常在当前实例和旧实例属性不一致时返回true
    return false;
  }
}

//五彩棋盘
class MyPainter4 extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    var rect = Offset.zero & size;
    drawChessboard(canvas, rect);
    drawPieces(canvas, rect);
  }
  //棋盘
  void drawChessboard(Canvas canvas, Rect rect){
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..invertColors = false;

    double w = rect.width/15;
    double h = rect.height/15;
    for(int i = 0; i < 15; i++){
      for(int j = 0; j < 15; j++){
        Rect rect = Rect.fromPoints(Offset(w * j,h * i), Offset(w*(j+1),h*(i+1)));
        switch(i){
          case 0:
          case 8:
          case 6:
          case 10:
          case 12:
          case 14:
            canvas.drawRect(rect, paint..color = (i%2==0 && j%2==0 ? Colors.blue : Colors.deepOrange));
            break;
          case 1:
          case 3:
          case 5:
          case 9:
          case 11:
            canvas.drawRect(rect, paint..color = (i%3==1 && j%3==1 ? Colors.red : Colors.green));
            break;
          case 2:
          case 7:
          case 4:
          case 13:
            canvas.drawRect(rect, paint..color = (i%2==0 && j%2==0 ? Colors.amber : Colors.purple));
            break;
        }
      }
    }
  }
  //棋子
  void drawPieces(Canvas canvas,Rect rect){
    double w = rect.width/15;
    double h = rect.height/15;
    var paint = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.green;
    canvas.drawCircle(
        Offset(rect.center.dx - w/2, rect.center.dy - h/2),
        min(w/2, h/2) - 2,
        paint
    );
    paint.color = Colors.white;
    canvas.drawCircle(
        Offset(rect.center.dx + w/2, rect.center.dy + h/2),
        min(w/2, h/2) - 2,
        paint
    );
    canvas.drawCircle(
        Offset(1, rect.center.dy + h/2),
        min(w/2, h/2) - 2,
        paint
    );

  }
  @override
  bool shouldRepaint(MyPainter oldDelegate){
    //shouldRepaint方法通常在当前实例和旧实例属性不一致时返回true
    return true;
  }
}



