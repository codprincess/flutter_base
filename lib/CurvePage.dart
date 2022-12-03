import 'dart:math';

import 'package:flutter/material.dart';

class CurvePage extends StatefulWidget {
  const CurvePage({Key? key}) : super(key: key);

  @override
  State<CurvePage> createState() => _CurvePageState();
}

class _CurvePageState extends State<CurvePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    )..repeat(reverse: true);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Curves'),),
      body: SlideLine(),
      // body: Center(
      //   child: Column(
      //     children: [
      //       ScaleTransition(
      //         scale: Tween(begin: 0.1,end:2.0).animate(_controller),
      //         child: Container(
      //           width: 200,
      //           height: 200,
      //           color: Colors.blue,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}


class CustomCurve extends Curve {
  final double count;

  const CustomCurve({this.count = 1});

  @override
  double transform(double t) {
    return sin(count * 2 * t) * 0.5 + 0.5;
  }
}

class SlideLine extends StatefulWidget {
  const SlideLine({Key? key}) : super(key: key);

  @override
  State<SlideLine> createState() => _SlideLineState();
}

class _SlideLineState extends State<SlideLine> with SingleTickerProviderStateMixin {
   late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(duration:const Duration(seconds: 1), vsync: this)..repeat(reverse: true);
  }

   @override
   void dispose() {
     // TODO: implement dispose
     super.dispose();
     _controller.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: Tween(begin: Offset(0,0),end: Offset(0,1))
            .chain(CurveTween(curve: Curves.bounceOut))//曲线特征
            .chain(CurveTween(curve: Interval(0,0.5)))
            .animate(_controller),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}
