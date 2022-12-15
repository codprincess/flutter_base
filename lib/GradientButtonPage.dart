import 'package:flutter/material.dart';
import 'package:flutter_base/GradientButton.dart';

class GradientButtonPage extends StatefulWidget {
  const GradientButtonPage({Key? key}) : super(key: key);

  @override
  State<GradientButtonPage> createState() => _GradientButtonPageState();
}

class _GradientButtonPageState extends State<GradientButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('自定义组件'),),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientButton(
            colors: const [Colors.orange,Colors.red],
            height: 50.0,
            onPressed: (){print('点击');},
            child: const Text('按钮')
          )
        ],
      ),
    );
  }
}
