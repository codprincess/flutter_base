import 'package:flutter/material.dart';

class ScaleTransitionPage extends StatefulWidget {
  const ScaleTransitionPage({Key? key}) : super(key: key);

  @override
  State<ScaleTransitionPage> createState() => _ScaleTransitionPageState();
}

class _ScaleTransitionPageState extends State<ScaleTransitionPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
     // value: 0.1,//可以设置初始值,则动画开始时，其比例将为其原始大小的 0.1
      vsync: this
    )..repeat(reverse: true);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    //也可以用Tween指定变化区间
    _animation = Tween<double>(begin: .1,end: 1.0).animate(_animation);
    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScaleTransition'),),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          alignment: Alignment.topRight,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
