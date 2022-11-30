import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerPage extends StatefulWidget {
  const GestureRecognizerPage({Key? key}) : super(key: key);

  @override
  State<GestureRecognizerPage> createState() => _GestureRecognizerPageState();
}

class _GestureRecognizerPageState extends State<GestureRecognizerPage> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GestureRecognizer'),),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: '学习flutter'),
              TextSpan(
                text: '点我变色哦',
                style: TextStyle(
                  fontSize: 30,
                  color:_toggle?Colors.blue:Colors.red
                ),
                recognizer: _tapGestureRecognizer..onTap = (){
                  setState(() {
                    _toggle = !_toggle;
                  });
                }
              ),
              const TextSpan(text: '你好flutter'),
            ]
          )
        ),
      ),
    );
  }
}
