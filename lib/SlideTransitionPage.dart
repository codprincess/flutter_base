import 'package:flutter/material.dart';

class SlideTransitionPage extends StatefulWidget {
  const SlideTransitionPage({Key? key}) : super(key: key);

  @override
  State<SlideTransitionPage> createState() => _SlideTransitionPageState();
}

class _SlideTransitionPageState extends State<SlideTransitionPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this
    )..repeat(reverse: true);
    final _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInCubic);

    _animation = Tween<Offset>(
      begin: const Offset(-0.5, 0.0),
      end: const Offset(1,2.0),
    ).animate(_curvedAnimation);

    _controller.addListener(() {
      setState(() {

      });
    });
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
      appBar: AppBar(title: const Text('SlideTransition'),),
      body: Center(
        child: SlideTransition(
          position: _animation,
          textDirection: TextDirection.rtl,//移动方向
          transformHitTests: false,
          child: InkWell(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('点击'))
              );
            },
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          )
        ),
      )
    );
  }
}
