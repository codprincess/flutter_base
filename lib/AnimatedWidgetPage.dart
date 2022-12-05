import 'package:flutter/material.dart';

class ScaleImage extends AnimatedWidget{
  //构造函数
  const ScaleImage({
      Key? key,
      required Animation<double> animation
  }):super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context){
    // 获取动画
    final _animation = listenable as Animation<double>;
    return Center(
      // 布局组件中使用动画的值 , 以达到动画效果
      child: Image.asset('images/avatar.jpg',width: _animation.value,height: _animation.value,),
    );
  }
}

class AnimatedWidgetPage extends StatefulWidget {
  const AnimatedWidgetPage({Key? key}) : super(key: key);

  @override
  State<AnimatedWidgetPage> createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage> with SingleTickerProviderStateMixin {
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
      appBar: AppBar(title:const Text('AnimatedWidget'),),
      body: Center(
        child: ScaleImage(
          animation: _animation,// 传入动画对象 _animation
        ),
      )
    );
  }
}
