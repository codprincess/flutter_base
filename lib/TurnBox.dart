import 'package:flutter/material.dart';
class TurnBox extends StatefulWidget {
  final double turns;//旋转的“圈”数,一圈为360度，如0.25圈即90度
  final int speed;//过渡动画执行的总时长
  final Widget? child;
  const TurnBox({
    Key? key,
     this.turns = .0,
     this.speed = 200,
     this.child,
  }) : super(key: key);

  @override
  State<TurnBox> createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      lowerBound: -double.infinity,
      upperBound: double.infinity,
      vsync: this
    );
    _animationController.value = widget.turns;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //我们是通过组合RotationTransition和child来实现的旋转效果。
    return RotationTransition(
      turns: _animationController,
      child: widget.child,
    );
  }

  //在didUpdateWidget中，我们判断要旋转的角度是否发生了变化，如果变了，则执行一个过渡动画。
  @override
  void didUpdateWidget(covariant TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //旋转角度发生变化时执行过渡动画
    if(oldWidget.turns != widget.turns){
      _animationController.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed??200),
        curve: Curves.easeOut,
      );
    }
  }
}
