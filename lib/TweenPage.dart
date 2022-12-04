import 'package:flutter/material.dart';

class TweenPage extends StatefulWidget {
  const TweenPage({Key? key}) : super(key: key);

  @override
  State<TweenPage> createState() => _TweenPageState();
}

class _TweenPageState extends State<TweenPage> {
  late AnimationController _controller;
  late Animation  _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation = SizeTween(begin: const Size(20,20),end: const Size(30,30)).animate(_controller);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
