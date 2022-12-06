import 'package:flutter/material.dart';

class DefaultTextStyleTransitionPage extends StatefulWidget {
  const DefaultTextStyleTransitionPage({Key? key}) : super(key: key);

  @override
  State<DefaultTextStyleTransitionPage> createState() => _DefaultTextStyleTransitionPageState();
}

class _DefaultTextStyleTransitionPageState extends State<DefaultTextStyleTransitionPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late TextStyleTween _textStyleTween;
  late CurvedAnimation _curvedAnimation;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this
    )..repeat(reverse: true);

    _textStyleTween = TextStyleTween(
      begin: const TextStyle(fontSize: 50,color: Colors.blue,fontWeight: FontWeight.w800),
      end: const TextStyle(fontSize: 50,color: Colors.red,fontWeight: FontWeight.w100)
    );
    _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

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
      appBar: AppBar(title: const Text('DefaultTextStyleTransition'),),
      body: Center(
        child: DefaultTextStyleTransition(
          style: _textStyleTween.animate(_curvedAnimation),
          child: const Text('一起学习flutter'),
        ),
      ),
    );
  }
}
