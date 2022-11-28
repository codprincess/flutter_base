import 'package:flutter/material.dart';

class VisibilityPage extends StatefulWidget {
  const VisibilityPage({Key? key}) : super(key: key);

  @override
  State<VisibilityPage> createState() => _VisibilityPageState();
}

class _VisibilityPageState extends State<VisibilityPage> {
  bool _isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Visibility'),),
        body: Center(
          child: Column(
            children: [
              Visibility(
                visible: _isShow,
                // maintainSize: true,
                // maintainAnimation: true,
                // maintainState: false,
                replacement: Image.asset('images/avatar.jpg',height: 300,width: 300,),
                child: Image.asset('images/logo.png',height: 300,width: 300,),
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




