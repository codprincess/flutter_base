import 'dart:math';

import 'package:flutter/material.dart';

class TransformPage extends StatelessWidget {
  const TransformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transform'),),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform(
              transform: Matrix4.rotationZ(0.5),//绕z轴旋转弧度
              //origin参数表示变换矩阵的坐标，默认是（0,0）即左上角，如果想围绕圆心旋转
              origin: const Offset(50,50),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20,),
            Transform.translate(
              offset: const Offset(50.0,100.0),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              )
            ),
            const SizedBox(height: 100,),
            Transform.rotate(
                angle: pi/4,//pi/4,也就是45度
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 100,),
            Transform.scale(
              //scale: 1.5,
              scaleX: 1.5,
               scaleY: 1,
               child: Container(
                 width: 100,
                 height: 100,
                 color: Colors.red,
               ),
            )

          ],
        ),
      ),
    );
  }
}


