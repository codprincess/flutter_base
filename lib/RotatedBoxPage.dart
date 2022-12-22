import 'package:flutter/material.dart';

class RotatedBoxPage extends StatelessWidget {
  const RotatedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RotatedBox'),),
      body: Center(
        child: Column(
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  '旋转1次',
                  style: TextStyle(color: Colors.white,fontSize: 30),
                ),
              ),
            ),
            RotatedBox(
              quarterTurns: 2,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  '旋转2次',
                  style: TextStyle(color: Colors.white,fontSize: 30),
                ),
              ),
            ),
            RotatedBox(
              quarterTurns: -1,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text(
                  '旋转-1次',
                  style: TextStyle(color: Colors.white,fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
