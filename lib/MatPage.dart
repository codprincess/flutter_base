import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Matrix4Page extends StatefulWidget {
  const Matrix4Page({Key? key}) : super(key: key);

  @override
  State<Matrix4Page> createState() => _Matrix4PageState();
}

class _Matrix4PageState extends State<Matrix4Page> with TickerProviderStateMixin {
  List<double> list = [
    1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, 0.0, 1.0
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Matrix4'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            // Transform(
            //   transform: Matrix4.identity()..rotateZ(pi/16),
            //   origin: const Offset(100,50),//旋转点
            //   child: Container(
            //     width: 200,
            //     height: 100,
            //     color: Colors.green,
            //     child: const Center(child: Text('Matrix4.identity'),),
            //   ),
            // ),
            // const SizedBox(height: 50,),
            // Transform(
            //   transform: Matrix4.zero()..setIdentity()..rotateZ(pi/16),
            //   origin: const Offset(100,50),//旋转点
            //   child: Container(
            //     width: 200,
            //     height: 100,
            //     color: Colors.green,
            //     child: const Center(child: Text('Matrix4.zero'),),
            //   ),
            // ),
            const SizedBox(height: 50,),
            Transform(
              transform: Matrix4.fromList(list)..rotateZ(pi/16),
              origin: const Offset(100,50),//旋转点
              child: Container(
                width: 200,
                height: 100,
                color: Colors.green,
                child: const Center(child: Text('Matrix4.fromList'),),
              ),
            ),
            const SizedBox(height: 50,),
            // Transform(
            //   //copy：复制一个4*4的矩阵
            //   // transform: Matrix4.copy(Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)),
            //   transform: Matrix4.copy(Matrix4.identity()),//同上都是复制一个4*4的矩阵
            //   origin: const Offset(100,50),//旋转点
            //   child: Container(
            //     width: 200,
            //     height: 100,
            //     color: Colors.green,
            //     child: const Center(child: Text('Matrix4.copy'),),
            //   ),
            // ),
            // const SizedBox(height: 50,),
            // Transform(
            //   transform: Matrix4.columns(
            //     vector.Vector4(1.0,0.0,0.0,0.0),
            //     vector.Vector4(0.0,1.0,0.0,0.0),
            //     vector.Vector4(0.0,0.0,1.0,0.0),
            //     vector.Vector4(0.0,0.0,0.0,1.0),
            //   ),
            //   origin: const Offset(100,50),//旋转点
            //   child: Container(
            //     width: 200,
            //     height: 100,
            //     color: Colors.green,
            //     child: const Center(child: Text('Matrix4.fromList'),),
            //   ),
            // ),
            const SizedBox(height: 50,),
            Transform(
              transform: Matrix4.inverted(Matrix4.fromList(list)..rotateZ(pi/16)),
              origin: const Offset(100,50),//旋转点
              child: Container(
                width: 200,
                height: 100,
                color: Colors.green,
                child: const Center(child: Text('Matrix4.inverted'),),
              ),
            ),
            const SizedBox(height: 50,),
            // Transform(
            //   transform: Matrix4.diagonal3(vector.Vector3(1.5,1.0,1.0)),
            //   origin: const Offset(100,50),//旋转点
            //   child: Container(
            //     width: 200,
            //     height: 100,
            //     color: Colors.green,
            //     child: const Center(child: Text('Matrix4.diagonal3'),),
            //   ),
            // ),
            // const SizedBox(height: 10,),
            // Transform(
            //   transform: Matrix4.diagonal3(vector.Vector3.array([0.5,0.5,0.5])),
            //   origin: const Offset(100,50),//旋转点
            //   child: Container(
            //     width: 200,
            //     height: 100,
            //     color: Colors.green,
            //     child: const Center(child: Text('Matrix4.diagonal3'),),
            //   ),
            // ),

            // const SizedBox(height: 50,),
            // Transform(
            //   transform: Matrix4.diagonal3Values(1.5,1.0,1.0),
            //   origin: const Offset(100,50),//旋转点
            //   child: Container(
            //     width: 200,
            //     height: 100,
            //     color: Colors.green,
            //     child: const Center(child: Text('Matrix4.diagonal3Values'),),
            //   ),
            // ),
            // const SizedBox(height: 10,),
            // Transform(
            //   transform: Matrix4.diagonal3Values(0.5,0.5,0.5),
            //   origin: const Offset(100,50),//旋转点
            //   child: Container(
            //     width: 200,
            //     height: 100,
            //     color: Colors.green,
            //     child: const Center(child: Text('Matrix4.diagonal3Values'),),
            //   ),
            // ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Transform(
            //       transform: Matrix4.translation(vector.Vector3(10.0,10.0,10.0)),
            //       child: Container(
            //         width: 150,
            //         height: 50,
            //         color: Colors.green,
            //         child: const Center(child: Text('Matrix4.translation'),),
            //       ),
            //     ),
            //     Transform(
            //       transform: Matrix4.translation(vector.Vector3.array([-10.0,-10.0,-10.0])),
            //       child: Container(
            //         width: 150,
            //         height: 50,
            //         color: Colors.green,
            //         child: const Center(child: Text('Matrix4.translation'),),
            //       ),
            //     ),
            //   ],
            // )

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Transform(
            //       transform: Matrix4.translationValues(10.0,10.0,10.0),
            //       child: Container(
            //         width: 150,
            //         height: 50,
            //         color: Colors.green,
            //         child: const Center(child: Text('Matrix4.translation'),),
            //       ),
            //     ),
            //     Transform(
            //       transform: Matrix4.translationValues(-10.0,-10.0,-10.0),
            //       child: Container(
            //         width: 150,
            //         height: 50,
            //         color: Colors.green,
            //         child: const Center(child: Text('Matrix4.translation'),),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform(
                  transform: Matrix4.rotationX(pi/3),
                  origin: const Offset(100,100),//旋转点
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    child: const Center(child: Text('Matrix4.rotationX'),),
                  ),
                ),

                Transform(
                  transform: Matrix4.rotationX(pi/6),
                  origin: const Offset(100,100),//旋转点
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    child: const Center(child: Text('Matrix4.rotationX'),),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 40,),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Transform(
            //       transform: Matrix4.rotationY(pi/3),
            //       origin: const Offset(100,100),//旋转点
            //       child: Container(
            //         width: 100,
            //         height: 100,
            //         color: Colors.green,
            //         child: const Center(child: Text('Matrix4.rotationY'),),
            //       ),
            //     ),
            //
            //     Transform(
            //       transform: Matrix4.rotationY(pi/6),
            //       origin: const Offset(100,100),//旋转点
            //       child: Container(
            //         width: 100,
            //         height: 100,
            //         color: Colors.green,
            //         child: const Center(child: Text('Matrix4.rotationY'),),
            //       ),
            //     ),
            //
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform(
                  transform: Matrix4.rotationZ(0),
                  origin: const Offset(50,50),//旋转点
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    child: const Center(child: Text('Matrix4.rotationZ'),),
                  ),
                ),

                Transform(
                  transform: Matrix4.rotationZ(45),
                  origin: const Offset(50,50),//旋转点
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                    child: const Center(child: Text('Matrix4.rotationZ'),),
                  ),
                ),

              ],
            )
            





          ],
        ),
      ),

    );
  }
}
