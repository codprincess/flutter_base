import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Matrix4Page extends StatefulWidget {
  const Matrix4Page({Key? key}) : super(key: key);

  @override
  State<Matrix4Page> createState() => _Matrix4PageState();
}

class _Matrix4PageState extends State<Matrix4Page> with TickerProviderStateMixin {
  // List<double> list = [
  //   1.0, 0.0, 0.0, 0.0,
  //   0.0, 1.0, 0.0, 0.0,
  //   0.0, 0.0, 1.0, 0.0,
  //   0.0, 0.0, 0.0, 1.0
  // ];

   final Matrix4 _begin = Matrix4.compose(
      vector.Vector3(0,0,1),
      vector.Quaternion.euler(0, 0, 0),
      vector.Vector3(1,1,1)
  );
  final Matrix4 _midway = Matrix4.compose(
      vector.Vector3(0,0,1),
      vector.Quaternion.euler(1, -0.2, 0),
      vector.Vector3(.8,.8,.8)
  );

  final Matrix4 _finally = Matrix4.compose(
      vector.Vector3(0,0,1),
      vector.Quaternion.euler(1, 0, 0),
      vector.Vector3(1,1,1)
  );
   Matrix4 _end = Matrix4.compose(
      vector.Vector3(0,0,1),
      vector.Quaternion.euler(1, -0.2, 0),
      vector.Vector3(0.8,0.8,0.8)
  );

  @override
  Widget build(BuildContext context){
    return TweenAnimationBuilder(
        tween: Tween(begin: _begin,end: _end),
        duration: const Duration(seconds: 2), 
        builder: (BuildContext context,Matrix4 value,Widget? _){
          return Transform(
            transform: value,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Matrix4'),
                backgroundColor: Colors.transparent,
              ),
              body: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  setState(() {
                    if(_end == _begin){
                      _end = _midway;
                    }else if(_end == _midway){
                      _end = _finally;
                    }else{
                      _end = _begin;
                    }
                  });
                },
                child: const Icon(Icons.rotate_left),
              ),
            ),
          );    
        }
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.black,
  //     appBar: AppBar(
  //       title: const Text('Matrix4'),
  //       backgroundColor: Colors.transparent,
  //     ),
  //
  //     body: Center(
  //       child: Column(
  //         children: [
  //           // Transform(
  //           //   transform: Matrix4.identity()..rotateZ(pi/16),
  //           //   origin: const Offset(100,50),//旋转点
  //           //   child: Container(
  //           //     width: 200,
  //           //     height: 100,
  //           //     color: Colors.green,
  //           //     child: const Center(child: Text('Matrix4.identity'),),
  //           //   ),
  //           // ),
  //           // const SizedBox(height: 50,),
  //           // Transform(
  //           //   transform: Matrix4.zero()..setIdentity()..rotateZ(pi/16),
  //           //   origin: const Offset(100,50),//旋转点
  //           //   child: Container(
  //           //     width: 200,
  //           //     height: 100,
  //           //     color: Colors.green,
  //           //     child: const Center(child: Text('Matrix4.zero'),),
  //           //   ),
  //           // ),
  //           // const SizedBox(height: 50,),
  //           // Transform(
  //           //   transform: Matrix4.fromList(list)..rotateZ(pi/16),
  //           //   origin: const Offset(100,50),//旋转点
  //           //   child: Container(
  //           //     width: 200,
  //           //     height: 100,
  //           //     color: Colors.green,
  //           //     child: const Center(child: Text('Matrix4.fromList'),),
  //           //   ),
  //           // ),
  //           // const SizedBox(height: 50,),
  //           // Transform(
  //           //   //copy：复制一个4*4的矩阵
  //           //   // transform: Matrix4.copy(Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)),
  //           //   transform: Matrix4.copy(Matrix4.identity()),//同上都是复制一个4*4的矩阵
  //           //   origin: const Offset(100,50),//旋转点
  //           //   child: Container(
  //           //     width: 200,
  //           //     height: 100,
  //           //     color: Colors.green,
  //           //     child: const Center(child: Text('Matrix4.copy'),),
  //           //   ),
  //           // ),
  //           // const SizedBox(height: 50,),
  //           // Transform(
  //           //   transform: Matrix4.columns(
  //           //     vector.Vector4(1.0,0.0,0.0,0.0),
  //           //     vector.Vector4(0.0,1.0,0.0,0.0),
  //           //     vector.Vector4(0.0,0.0,1.0,0.0),
  //           //     vector.Vector4(0.0,0.0,0.0,1.0),
  //           //   ),
  //           //   origin: const Offset(100,50),//旋转点
  //           //   child: Container(
  //           //     width: 200,
  //           //     height: 100,
  //           //     color: Colors.green,
  //           //     child: const Center(child: Text('Matrix4.fromList'),),
  //           //   ),
  //           // ),
  //           // const SizedBox(height: 50,),
  //           // Transform(
  //           //   transform: Matrix4.inverted(Matrix4.fromList(list)..rotateZ(pi/16)),
  //           //   origin: const Offset(100,50),//旋转点
  //           //   child: Container(
  //           //     width: 200,
  //           //     height: 100,
  //           //     color: Colors.green,
  //           //     child: const Center(child: Text('Matrix4.inverted'),),
  //           //   ),
  //           // ),
  //           // const SizedBox(height: 50,),
  //           // Transform(
  //           //   transform: Matrix4.diagonal3(vector.Vector3(1.5,1.0,1.0)),
  //           //   origin: const Offset(100,50),//旋转点
  //           //   child: Container(
  //           //     width: 200,
  //           //     height: 100,
  //           //     color: Colors.green,
  //           //     child: const Center(child: Text('Matrix4.diagonal3'),),
  //           //   ),
  //           // ),
  //           // const SizedBox(height: 10,),
  //           // Transform(
  //           //   transform: Matrix4.diagonal3(vector.Vector3.array([0.5,0.5,0.5])),
  //           //   origin: const Offset(100,50),//旋转点
  //           //   child: Container(
  //           //     width: 200,
  //           //     height: 100,
  //           //     color: Colors.green,
  //           //     child: const Center(child: Text('Matrix4.diagonal3'),),
  //           //   ),
  //           // ),
  //
  //           // const SizedBox(height: 50,),
  //           // Transform(
  //           //   transform: Matrix4.diagonal3Values(1.5,1.0,1.0),
  //           //   origin: const Offset(100,50),//旋转点
  //           //   child: Container(
  //           //     width: 200,
  //           //     height: 100,
  //           //     color: Colors.green,
  //           //     child: const Center(child: Text('Matrix4.diagonal3Values'),),
  //           //   ),
  //           // ),
  //           // const SizedBox(height: 10,),
  //           // Transform(
  //           //   transform: Matrix4.diagonal3Values(0.5,0.5,0.5),
  //           //   origin: const Offset(100,50),//旋转点
  //           //   child: Container(
  //           //     width: 200,
  //           //     height: 100,
  //           //     color: Colors.green,
  //           //     child: const Center(child: Text('Matrix4.diagonal3Values'),),
  //           //   ),
  //           // ),
  //
  //           // Row(
  //           //   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           //   children: [
  //           //     Transform(
  //           //       transform: Matrix4.translation(vector.Vector3(10.0,10.0,10.0)),
  //           //       child: Container(
  //           //         width: 150,
  //           //         height: 50,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('Matrix4.translation'),),
  //           //       ),
  //           //     ),
  //           //     Transform(
  //           //       transform: Matrix4.translation(vector.Vector3.array([-10.0,-10.0,-10.0])),
  //           //       child: Container(
  //           //         width: 150,
  //           //         height: 50,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('Matrix4.translation'),),
  //           //       ),
  //           //     ),
  //           //   ],
  //           // )
  //
  //           // Row(
  //           //   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           //   children: [
  //           //     Transform(
  //           //       transform: Matrix4.translationValues(10.0,10.0,10.0),
  //           //       child: Container(
  //           //         width: 150,
  //           //         height: 50,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('Matrix4.translation'),),
  //           //       ),
  //           //     ),
  //           //     Transform(
  //           //       transform: Matrix4.translationValues(-10.0,-10.0,-10.0),
  //           //       child: Container(
  //           //         width: 150,
  //           //         height: 50,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('Matrix4.translation'),),
  //           //       ),
  //           //     ),
  //           //   ],
  //           // ),
  //           // const SizedBox(height: 30,),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Transform(
  //                 transform: Matrix4.rotationX(pi/3),
  //                 origin: const Offset(100,100),//旋转点
  //                 child: Container(
  //                   width: 100,
  //                   height: 100,
  //                   color: Colors.green,
  //                   child: const Center(child: Text('Matrix4.rotationX'),),
  //                 ),
  //               ),
  //
  //               Transform(
  //                 transform: Matrix4.rotationX(pi/6),
  //                 origin: const Offset(100,100),//旋转点
  //                 child: Container(
  //                   width: 100,
  //                   height: 100,
  //                   color: Colors.green,
  //                   child: const Center(child: Text('Matrix4.rotationX'),),
  //                 ),
  //               ),
  //
  //             ],
  //           ),
  //           const SizedBox(height: 40,),
  //
  //           // Row(
  //           //   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           //   children: [
  //           //     Transform(
  //           //       transform: Matrix4.rotationY(pi/3),
  //           //       origin: const Offset(100,100),//旋转点
  //           //       child: Container(
  //           //         width: 100,
  //           //         height: 100,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('Matrix4.rotationY'),),
  //           //       ),
  //           //     ),
  //           //
  //           //     Transform(
  //           //       transform: Matrix4.rotationY(pi/6),
  //           //       origin: const Offset(100,100),//旋转点
  //           //       child: Container(
  //           //         width: 100,
  //           //         height: 100,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('Matrix4.rotationY'),),
  //           //       ),
  //           //     ),
  //           //
  //           //   ],
  //           // ),
  //
  //           // Row(
  //           //   mainAxisAlignment: MainAxisAlignment.center,
  //           //   children: [
  //           //     Transform(
  //           //       transform: Matrix4.rotationZ(0),
  //           //       origin: const Offset(50,50),//旋转点
  //           //       child: Container(
  //           //         width: 100,
  //           //         height: 100,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('Matrix4.rotationZ'),),
  //           //       ),
  //           //     ),
  //           //
  //           //     Transform(
  //           //       transform: Matrix4.rotationZ(45),
  //           //       origin: const Offset(50,50),//旋转点
  //           //       child: Container(
  //           //         width: 100,
  //           //         height: 100,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('Matrix4.rotationZ'),),
  //           //       ),
  //           //     ),
  //           //
  //           //   ],
  //           // ),
  //           //
  //
  //           // Row(
  //           //   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           //   children: [
  //           //     Transform(
  //           //       transform: Matrix4.skewX(0),
  //           //       child: Container(
  //           //         width: 100,
  //           //         height: 100,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('skewX'),),
  //           //       ),
  //           //     ),
  //           //
  //           //     Transform(
  //           //       transform: Matrix4.skewX(pi/6),
  //           //       child: Container(
  //           //         width: 100,
  //           //         height: 100,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('skewX'),),
  //           //       ),
  //           //     ),
  //           //
  //           //   ],
  //           // ),
  //
  //           // Row(
  //           //   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           //   children: [
  //           //     Transform(
  //           //       transform: Matrix4.skewY(0),
  //           //       child: Container(
  //           //         width: 100,
  //           //         height: 100,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('skewY'),),
  //           //       ),
  //           //     ),
  //           //
  //           //     Transform(
  //           //       transform: Matrix4.skewY(pi/6),
  //           //       child: Container(
  //           //         width: 100,
  //           //         height: 100,
  //           //         color: Colors.green,
  //           //         child: const Center(child: Text('skewY'),),
  //           //       ),
  //           //     ),
  //           //
  //           //   ],
  //           // ),
  //
  //           //什么是Vector3
  //           //Vector 是向量，矢量的意思，向量既有大小，又有方向，Verctor3 就是三维向量，一个三维向量会有三个分量，分别是 x，y，z
  //           //Verctor3类在flutter中有两种构造方法，三个参数分别对应x/y/z轴方向缩放。
  //           // factory Vector3(double x, double y, double z) =>
  //           //   new Vector3.zero()..setValues(x, y, z);
  //           //
  //           // factory Vector3.array(List<double> array, [int offset = 0]) =>
  //           //    new Vector3.zero()..copyFromArray(array, offset);
  //           //使用Vector3，我们需要引入vector_math_64包，这个是flutter自带的，不需要我们去安装
  //           // import 'package:vector_math/vector_math_64.dart' as vector;
  //           //注意：vector_math和vector_math_64应该是针对32bit和64bit变体的，它们在包中作为两个不同的库实现。因此，需要在使用这些库的方式上保持一致性。
  //           // export 'package:vector_math/vector_math_64.dart'
  //           // 或者
  //           // export 'package:vector_math/vector_math.dart'
  //
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Transform(
  //                 transform: Matrix4.skew(0,0),
  //                 child: Container(
  //                   width: 100,
  //                   height: 100,
  //                   color: Colors.green,
  //                   child: const Center(child: Text('skew'),),
  //                 ),
  //               ),
  //               const SizedBox(width: 50,),
  //               Transform(
  //                 transform: Matrix4.skew(pi/6,pi/6),
  //                 child: Container(
  //                   width: 100,
  //                   height: 100,
  //                   color: Colors.green,
  //                   child: const Center(child: Text('skew'),),
  //                 ),
  //               ),
  //
  //             ],
  //           ),
  //
  //
  //
  //
  //
  //
  //         ],
  //       ),
  //     ),
  //
  //   );
  // }
}
