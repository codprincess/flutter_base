import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  const AnimatedBuilderPage({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderPage> createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this
    );
    //使用Tween图片宽高从0变到300
    _animation = Tween(begin: 0.0,end: 300.0).animate(_controller);
    //启动动画正向执行
    _controller.forward();
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
      appBar: AppBar(title: const Text('AnimatedBuilder'),),
      body: AnimatedBuilder(
        animation: _animation,
        child:  Image.asset('images/avatar.jpg',width: _animation.value,height: _animation.value,),
        builder: (BuildContext context,child){
          return Center(
            child: SizedBox(
              height: _animation.value,
              width: _animation.value,
              child: child,
            ),
          );
        },
      )
    );
  }
}
