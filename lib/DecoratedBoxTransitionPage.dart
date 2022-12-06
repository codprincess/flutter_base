import 'package:flutter/material.dart';

class DecoratedBoxTransitionPage extends StatefulWidget {
  const DecoratedBoxTransitionPage({Key? key}) : super(key: key);

  @override
  State<DecoratedBoxTransitionPage> createState() => _DecoratedBoxTransitionPageState();
}

class _DecoratedBoxTransitionPageState extends State<DecoratedBoxTransitionPage>  with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this
    )..repeat(reverse: true);
    super.initState();
  }

  final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.yellow,
      shape: BoxShape.circle,
      boxShadow:const [
        BoxShadow(offset: Offset(0,0),blurRadius: 30,spreadRadius: 0)
      ],
      border: Border.all(width: 10.0,color: Colors.orange)
    ),
    end: BoxDecoration(
      color: Colors.purple,
      shape: BoxShape.circle,
      boxShadow: const [
        BoxShadow(offset: Offset(20, 20),blurRadius: 30,spreadRadius: 0)
      ],
      border: Border.all(width: 50,color: Colors.red)
    )
  );
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DecoratedBoxTransition'),),
      body: Center(
        child: DecoratedBoxTransition(
          decoration: _decorationTween.animate(_controller),
          child: const SizedBox(
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
