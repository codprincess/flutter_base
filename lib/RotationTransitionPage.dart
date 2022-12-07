import 'package:flutter/material.dart';

class RotationTransitionPage extends StatefulWidget {
  const RotationTransitionPage({Key? key}) : super(key: key);

  @override
  State<RotationTransitionPage> createState() => _RotationTransitionPageState();
}

class _RotationTransitionPageState extends State<RotationTransitionPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _trurnsTween;
  late CurvedAnimation _curvedAnimation;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this
    )..repeat(reverse: true);
    _trurnsTween = Tween<double>(
      begin: 1,
      end: 3
    );
    _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RotationTransition'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _trurnsTween.animate(_curvedAnimation),
              alignment: Alignment.topRight,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
