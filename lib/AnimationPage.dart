import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
      upperBound: 650,
      lowerBound: 400,

    );
    _controller.addListener(() {
      setState(() {

      });
    });
    _controller.repeat(reverse: true);
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
      appBar: AppBar(title: const Text('Animation'),),
      body: Stack(
        children: [
          Image.asset(
            'images/qiuc.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Transform.translate(
            offset:  Offset(250,_controller.value),//改变y的偏移量
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
