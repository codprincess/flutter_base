import 'package:flutter/material.dart';

class AnimatedModalBarrierPage extends StatefulWidget {
  const AnimatedModalBarrierPage({Key? key}) : super(key: key);

  @override
  State<AnimatedModalBarrierPage> createState() => _AnimatedModalBarrierPageState();
}

class _AnimatedModalBarrierPageState extends State<AnimatedModalBarrierPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;
  bool _isLoading = false;
  late Widget __animatedModalBarrier;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this
    );
    ColorTween _colorTween = ColorTween(
      begin: const Color.fromARGB(100, 255, 255, 255),
      end: const Color.fromARGB(100, 127, 127, 127)
    );
    _animation = _colorTween.animate(_controller);
    __animatedModalBarrier = AnimatedModalBarrier(
      color: _animation,
      dismissible: true,
    );
    super.initState();
  }

  List<Widget> buildWidgetList(BuildContext context) {
    List<Widget> widgets = <Widget>[
      ElevatedButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          _controller.reset();
          _controller.forward();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('提示'),
            ),
          );

          Future.delayed(const Duration(seconds: 5), () {
            setState(() {
              _isLoading = false;
            });
          });
        },
        child:const Text('按钮'),
      ),
    ];

    if (_isLoading) {
      widgets.add(__animatedModalBarrier);
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedModalBarrier'),),
      body: Builder(
        builder: (context) => Center(
           child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: buildWidgetList(context),
              ),
            )
        ),
      )
    );
  }
}
