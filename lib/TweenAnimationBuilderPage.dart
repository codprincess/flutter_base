import 'package:flutter/material.dart';

//TweenAnimationBuilder可以自定义隐式动画，用法比较简单,适用于简单的动画
//- 构造函数
// const TweenAnimationBuilder({
//   super.key,
//   required this.tween,
//   required super.duration,
//   super.curve,
//   required this.builder,
//   super.onEnd,
//   this.child,
// })



class TweenAnimationBuilderPage extends StatefulWidget {
  const TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  State<TweenAnimationBuilderPage> createState() => _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
  bool isChange = false;
  var durationSeconds = 0;

  @override
  Widget build(BuildContext context) {
    final _colorTween = ColorTween(begin: Colors.white,end: Colors.yellow);
    final _colorTween2 = ColorTween(begin: Colors.yellow,end: Colors.white);
    return Scaffold(
      appBar: AppBar(title: const Text('TweenAnimationBuilder'),),
      body: Center(
        child: TweenAnimationBuilder(
          tween: isChange
              ? _colorTween
              : _colorTween2,
          curve: Curves.linear,
          duration: Duration(seconds: durationSeconds),
          builder: (_,Color? color,Widget? widget ){
            return Image(
              image: const AssetImage('images/liu.webp'),
              color: color,
              colorBlendMode: BlendMode.colorBurn,
            );
          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            isChange = !isChange;
            print(isChange);
            durationSeconds = 3;
          });
        },
        child: const Text('切换'),
      ),
    );
  }
}
