import 'package:flutter/material.dart';

class TweenPage extends StatefulWidget {
  const TweenPage({Key? key}) : super(key: key);

  @override
  State<TweenPage> createState() => _TweenPageState();
}

class _TweenPageState extends State<TweenPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation  _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //创建动画控制器
    _controller =  AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this
    );
    _controller.addListener(() {
      //监听插值变化
      setState(() {
        print(_animation.value);
      });
    });
    //添加动画状态监听
    _controller.addStatusListener((status) {
      //获取动画执行状态
      AnimationStatus status = _controller.status;
      //动画正向执行完成状态
      if(status == AnimationStatus.completed){
        //反向开启动画
        _controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        //动画反向执行完成时，正向开始执行动画
        _controller.forward();
      }
    });
    //颜色动画变化
    _animation = ColorTween(begin: Colors.green,end:Colors.blue).animate(_controller);
    Future.delayed(Duration.zero,(){
      _controller.forward();
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ColorTween'),),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: _animation.value,
        ),
      ),
    );
  }
}
