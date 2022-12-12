import 'package:flutter/material.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  const AnimatedSwitcherPage({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherPage> createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  Widget? _animateWidget;
  bool isSwitcher = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animateWidget = const Image(
      image: AssetImage('images/liu.webp'),
      fit: BoxFit.cover,
      height: double.infinity,
      key: ValueKey(1),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('AnimatedSwitcher'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            // transitionBuilder: (child,animation){
            //   return SizeTransition(
            //     sizeFactor: animation,
            //     child: child,
            //   );
            // },
            // transitionBuilder: (Widget child, Animation<double> animation){
            //   var tween = Tween<Offset>(begin: Offset(1,0),end: Offset(0,0));
            //   return MySlideTransition(
            //       position: tween.animate(animation),
            //       child: child
            //   );
            // },
            transitionBuilder: (Widget child, Animation<double> animation){
              return SlideTransitionX(
                position: animation,
                direction: AxisDirection.down,
                child: child,
              );
            },

            child: _animateWidget,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Text('点击',style: TextStyle(color: Colors.black),),
        onPressed: (){
          setState(() {
            isSwitcher = !isSwitcher;
            _animateWidget = isSwitcher
              ? const Image(
                    image: AssetImage('images/liu2.webp'),
                    fit: BoxFit.cover,
                    height: double.infinity,
                    key: ValueKey(2),
                 )
              : const Image(
                  image: AssetImage('images/liu.webp'),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  key: ValueKey(1),
                );
          });
        },
      ),
    );
  }
}
//左出右入
class MySlideTransition extends AnimatedWidget {
  const MySlideTransition({
    Key? key,
    required Animation<Offset> position,
    this.transformHitTests = true,
    required this.child
  }) :super(key: key, listenable:position);
  final bool transformHitTests;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<Offset>;
    Offset offset = position.value;
    if(position.status == AnimationStatus.reverse){
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}


class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key? key,
    required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    required this.child,
  }) : super(key: key,listenable: position){
   switch(direction){
     case AxisDirection.up:
       _tween = Tween(begin: const Offset(0, 1),end: const Offset(0, 0));
       break;
     case AxisDirection.right:
       _tween = Tween(begin: const Offset(-1, 0),end: const Offset(0, 0));
       break;
     case AxisDirection.down:
       _tween = Tween(begin: const Offset(0, -1),end: const Offset(0, 0));
       break;
     case AxisDirection.left:
       _tween = Tween(begin: const Offset(1, 0),end: const Offset(0, 0));
       break;
   }
  }

  final bool transformHitTests;
  final AxisDirection direction;
  final Widget child;
  late final Tween<Offset> _tween;
  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<double>;

    Offset offset = _tween.evaluate(position);
    if(position.status == AnimationStatus.reverse){
      switch(direction){
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}


