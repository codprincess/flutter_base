import 'dart:math';

import 'package:flutter/material.dart';

class InheritedWidgetPage extends StatefulWidget {
  const InheritedWidgetPage({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetPage> createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  late  int _score = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InheritedWidget'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Info(
              score: _score,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.score),
                  CurrentScore(),
                ],
              )
            ),
            OutlinedButton(
              onPressed: (){
                //点击改变分数
                setState(() {
                  _score = Random().nextInt(100);
                });
              },
              child: const Text('点击改变分数'),
            )
          ],
        ),
      ),
    );
  }
}


class Info extends InheritedWidget {
  final int score;
  const Info({
    Key? key,
    required this.score,
    required Widget child,
  }) : super(key: key,child: child);

  static Info? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Info>();
  }
  @override
  bool updateShouldNotify(covariant Info oldWidget){
    return score != oldWidget.score;
  }
}

class CurrentScore extends StatelessWidget{
  const CurrentScore({super.key});
  @override
  Widget build(BuildContext context){
    final Info? info = Info.of(context);
    return Container(
      child: Text('${info?.score}'),
    );
  }
}
