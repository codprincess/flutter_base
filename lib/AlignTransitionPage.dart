import 'package:flutter/material.dart';

class AlignTransitionPage extends StatefulWidget {
  const AlignTransitionPage({Key? key}) : super(key: key);

  @override
  State<AlignTransitionPage> createState() => _AlignTransitionPageState();
}

class _AlignTransitionPageState extends State<AlignTransitionPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<AlignmentGeometry> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this
    )..repeat(reverse: true);
    //指定一个Curve
    final _CurvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.ease);
    _animation = Tween<AlignmentGeometry>(begin: Alignment.bottomLeft,end: Alignment.topRight).animate(_CurvedAnimation);
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
      appBar: AppBar(title: const Text('AlignTransition'),),
      body: Container(
        color: Colors.white,
        child: AlignTransition(
          alignment: _animation,
          child:const Padding(
            padding: EdgeInsets.all(10),
            child: FlutterLogo(size: 100.0,),
          ),
        ),
      ),
    );
  }
}
