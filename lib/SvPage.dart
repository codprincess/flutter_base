
import 'package:flutter/material.dart';
class SvPage extends StatelessWidget {
  const SvPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
    final colors = [
      Colors.green,
      Colors.lightBlue,
      Colors.yellow,
      Colors.red,
    ];
    return MaterialApp(
      title: 'SingleChildScrollView',
      home: Scaffold(
        appBar: AppBar(title: const Text('SingleChildScrollView'),),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: arr.map((e) => Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
                color: colors[e % colors.length],
                child: Text('$e'),
              )).toList(),
            ),
          ),
        ),
      ),

    );
  }
}
