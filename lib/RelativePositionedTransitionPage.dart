import 'package:flutter/material.dart';

class RelativePositionedTransitionPage extends StatefulWidget {
  const RelativePositionedTransitionPage({Key? key}) : super(key: key);

  @override
  State<RelativePositionedTransitionPage> createState() => _RelativePositionedTransitionPageState();
}

class _RelativePositionedTransitionPageState extends State<RelativePositionedTransitionPage>
with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late RectTween _rectTween;
  late CurvedAnimation _curvedAnimation;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this
    )..repeat(reverse: true);

     _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    //PositionedTransition 控制器

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
    //获取设备高度
    double height = MediaQuery.of(context).size.height;
    _rectTween = RectTween(
      begin: Rect.fromLTRB(0, height, 0, 0),
      end: const Rect.fromLTRB(0, 0, 0, 0),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('RelativePositionedTransition'),),
      body: Center(
        child: Stack(
          children: [
            RelativePositionedTransition(
              rect: _rectTween.animate(_curvedAnimation),
              size: const Size(0,0),
              child: Container(
                color: Colors.red,
              )
            )
          ],
        ),
      ),
    );
  }
}


