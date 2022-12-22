import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_base/GradientCircular.dart';

import 'TurnBox.dart';

class GradientCircularPage extends StatefulWidget {
  const GradientCircularPage({Key? key}) : super(key: key);

  @override
  State<GradientCircularPage> createState() => _GradientCircularPageState();
}

class _GradientCircularPageState extends State<GradientCircularPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  //使用 TurnBox
  double _turns = .0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this
    );
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.forward){
        isForward = true;
      }else if(status == AnimationStatus.completed || status == AnimationStatus.dismissed){
        if(isForward){
          _animationController.reverse();
        }else{
          _animationController.forward();
        }
      }else if(status == AnimationStatus.reverse){
        isForward = false;
      }
    });

    _animationController.forward();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('圆形背景渐变进度条'),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context,child){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 10),
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 16.0,
                          children: [
                            GradientCircular(
                              colors: const [Colors.blue,Colors.blue],
                              radius: 50,
                              strokeWidth: 3,
                              value: _animationController.value,
                              stops: const [0.0,0.1],
                            ),
                            GradientCircular(
                              colors: const [Colors.red,Colors.orange,Colors.red],
                              radius: 50,
                              strokeWidth: 3,
                              value: _animationController.value,
                              stops: const [0.0, 0.5,0.9],
                            ),
                            GradientCircular(
                              colors: const [Colors.teal,Colors.orange,Colors.red],
                              radius: 50,
                              strokeWidth: 3,
                              value: CurvedAnimation(
                                parent: _animationController,
                                curve: Curves.decelerate
                              ).value,
                              stops: const [0.0, 0.5,0.9],
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: GradientCircular(
                                colors: [
                                  Colors.blue.shade700,
                                  Colors.blue.shade200
                                ],
                                radius: 50.0,
                                strokeWidth: 3.0,
                                strokeCapRound: true,
                                backgroundColor: Colors.transparent,
                                value: _animationController.value,
                                stops: const [0.0,1],
                              ),
                            ),
                            GradientCircular(
                              colors: [
                                Colors.red,
                                Colors.amber,
                                Colors.cyan,
                                Colors.green.shade200,
                                Colors.blue,
                                Colors.red
                              ],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              strokeCapRound: true,
                              stops: const [0.0, 0.2,0.4,0.6,0.8,1],
                              value: _animationController.value,
                            ),
                            //裁剪半圆
                            ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: SizedBox(
                                    child: GradientCircular(
                                      colors: [Colors.teal, Colors.cyan.shade500],
                                      radius: 50.0,
                                      strokeWidth: 3.0,
                                      value: _animationController.value,
                                      totalAngle: pi,
                                      strokeCapRound: true,
                                      stops: const [0.0,1],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            TurnBox(
                              turns:_turns,
                              speed: 500,
                              child: const Icon(Icons.refresh,size: 50,),
                            ),
                            ElevatedButton(
                              child: const Text("顺时针旋转1/5圈"),
                              onPressed: () {
                                setState(() {
                                  _turns += .2;
                                });
                              },
                            ),
                            ElevatedButton(
                              child: const Text("逆时针旋转1/5圈"),
                              onPressed: () {
                                setState(() {
                                  _turns -= .2;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
