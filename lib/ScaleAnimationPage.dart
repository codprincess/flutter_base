import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatefulWidget {
  const ScaleAnimationPage({Key? key}) : super(key: key);

  @override
  State<ScaleAnimationPage> createState() => _ScaleAnimationPageState();
}

class _ScaleAnimationPageState extends State<ScaleAnimationPage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //创建动画控制器
    _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this
    );
    //指定一个Curve
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    //使用Tween图片宽高从0变到300
    //_animation = Tween(begin: 0.0,end: 300.0).animate(_controller);
    _animation = Tween(begin: 0.0,end: 300.0).animate(_animation);
    //监听动画，并且更新ui
    _controller.addListener(() {
      setState(() {
       //监听插值变化
       print(_animation.value);
      });
    });
    _controller.addStatusListener((status) {
      print(status);
      //AnimationStatus.forward(动画正在正向执行)
      //AnimationStatus.completed( 动画在终点停止)
      //AnimationStatus.dismissed(动画在起始点停止)
      //AnimationStatus.reverse(动画正在反向执行)

    });
    //启动动画正向执行
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();//路由销毁时需要释放动画资源，以防止内存泄漏
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('图片变大'),),
      body: Center(
        child: Image.asset('images/avatar.jpg',width: _animation.value,height: _animation.value,),
      ),
    );
  }

}
