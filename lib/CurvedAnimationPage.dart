import 'package:flutter/material.dart';

class CurvedAnimationPage extends StatefulWidget {
  const CurvedAnimationPage({Key? key}) : super(key: key);

  @override
  State<CurvedAnimationPage> createState() => _CurvedAnimationPageState();
}

class _CurvedAnimationPageState extends State<CurvedAnimationPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    );
    //通过CurvedAnimation来指定动画的曲线
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn
    );
    //通过Tween来生成不同的区间范围值，Tween不保存任何状态，它只是起始值的变换函数。
    _animation = Tween<double>(begin:600 ,end: 400).animate(curvedAnimation);
    _controller.addListener(() {
      //监听插值变化
      setState(() {
        //print(_animation.value);
      });
    });
   _controller.repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CurvedAnimation'),),
      body: Stack(
        children: [
          Image.asset(
            'images/qiuc.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Transform.translate(
            offset:  Offset(250,_animation.value),//改变y的偏移量
            child: Image.asset(
              'images/qiu.png',
              fit: BoxFit.contain,
              height: 70,
              width: 70,
            ),
          )
        ],
      ),
    );
  }
}

