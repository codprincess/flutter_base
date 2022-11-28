import 'package:flutter/material.dart';

class OffstagePage extends StatefulWidget {
  const OffstagePage({Key? key}) : super(key: key);

  @override
  State<OffstagePage> createState() => _OffstagePageState();
}

class _OffstagePageState extends State<OffstagePage> {
  bool _isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offstage'),),
      body: Center(
        child: Column(
          children: [
            Offstage(
              offstage: _isShow,
              child: const Text('显示或者隐藏'),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    _isShow = !_isShow;
                  });
                },
                child: Text(
                  _isShow ? '隐藏':'显示',
                  style: const TextStyle(fontSize: 20),
                )
            )
          ],
        ),
      )
    );
  }
}
