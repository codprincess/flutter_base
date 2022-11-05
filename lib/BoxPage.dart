import 'package:flutter/material.dart';
import 'dart:math' as math;
class BoxPage extends StatelessWidget {
  const BoxPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BoxDecoration详解'),),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
              decoration: const BoxDecoration(
                border: Border(
                  //下划线位置、线宽、颜色
                  bottom:BorderSide(width: 2.0,color: Colors.red),
                )
              ),
              child:const Text('我是下划线！'),
            ),
            // SizedBox(height: 30.0,),
            // Container(
            //   padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
            //   decoration:  BoxDecoration(
            //       border: Border.all(
            //         width: 2.0,
            //         color: Colors.red,
            //       ),
            //   ),
            //   child:const Text('我是下划线！'),
            // ),
            Container(
             width: double.infinity,
             height: 40,
             alignment: Alignment.center,
             decoration: const BoxDecoration(
               border: Border(
                 bottom: BorderSide(width: 1.0,color: Colors.red),
               )
             ),
              child: const Text('我是分割线'),
            ),
            Container(
              height: 50,
              width: 200,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                //背景颜色
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              child: const Text('圆角背景',style: TextStyle(color: Colors.white),),
            ),
            Container(
              height: 50,
              width: 200,
              alignment: Alignment.center,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                border: Border.all(
                  width: 1.0,
                  color: Colors.blue,
                )
              ),
              child: const Text('圆角线框',style: TextStyle(color: Colors.blue),),
            ),
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Text('圆形背景',style: TextStyle(color: Colors.white),),
            ),

            SizedBox(height: 10.0,),
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue),
              ),
              child: const Text('圆形背景',style: TextStyle(color: Colors.blue),),
            ),

            Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6
                  )
                ]
              ),
              child: const Text('阴影',style: TextStyle(color: Colors.blue),),
            ),
            SizedBox(height: 10.0,),
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                //线性变性
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue,Colors.purple],
                )
              ),
              child: const Text('线性渐变',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 20.0,),
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration:  const BoxDecoration(
                  shape: BoxShape.circle,
                  //弧形变性
                  gradient: SweepGradient(
                      colors: [
                        Colors.red,
                        Colors.blue,
                        Colors.yellow,
                        Colors.green,
                        Colors.red,
                      ],
                      center: FractionalOffset.center,
                      startAngle: 0.0,
                      endAngle: math.pi * 2,
                      stops: [0,0.25,0.5,0.75,1],

                  )
              ),
              child: const Text('弧形渐变',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 20.0,),
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  radius: 0.6,
                  colors: [Colors.red,Colors.blue],
                  stops: [0.2,0.9]
                )
              ),
              child: const Text('扩散渐变',style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
