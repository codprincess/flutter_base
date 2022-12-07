import 'package:flutter/material.dart';

class PositionedTransitionPage extends StatefulWidget {
  const PositionedTransitionPage({Key? key}) : super(key: key);

  @override
  State<PositionedTransitionPage> createState() => _PositionedTransitionPageState();
}

class _PositionedTransitionPageState extends State<PositionedTransitionPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late RelativeRectTween _relativeRectTween;
  late CurvedAnimation _curvedAnimation;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this
    )..repeat(reverse: true);

    //PositionedTransition 控制器
    _relativeRectTween = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(100.0, 100.0, 100.0, 100.0),
      end:const RelativeRect.fromLTRB(20.0, 20.0, 20.0, 20.0)
    );

    _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.ease);

    _curvedAnimation.addListener(() {
      setState(() {
       print(_relativeRectTween.toString());
      });
    });
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
      appBar: AppBar(title: const Text('PositionedTransition'),),
      body: Center(
        child: Stack(
          children: [
            PositionedTransition(
                rect: _relativeRectTween.animate(_curvedAnimation),
                child: Container(
                  color: Colors.red,
                  child: const Text('一起学习flutter'),
                )
            )
          ],
        ),
      )
    );
  }
}
