import 'package:flutter/material.dart';

class SizeTransitionPage extends StatefulWidget {
  const SizeTransitionPage({Key? key}) : super(key: key);

  @override
  State<SizeTransitionPage> createState() => _SizeTransitionPageState();
}

class _SizeTransitionPageState extends State<SizeTransitionPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this
    )..repeat();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
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
      appBar: AppBar(title: const Text('SizeTransition'),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.horizontal,
              axisAlignment: 1.0,
              child: Image.asset('images/bird.png',width: 200,height: 200,),
            ),
            Container(
              alignment: Alignment.center,
              margin:const EdgeInsets.only(top: 50),
              width: double.infinity,
              child: SizeTransition(
                sizeFactor: _animation,
                axis: Axis.horizontal,
                axisAlignment: 0.0,
                child: Image.asset('images/logo.png',width: 400,height: 200,),
              ),
            )

          ],
        ),
      )


    );
  }
}
