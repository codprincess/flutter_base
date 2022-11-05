import 'package:flutter/material.dart';

class RoutePageB extends StatelessWidget {
  const RoutePageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text('提示'),),
      body: Center(
        child: Column(
          children: [
            Text('$args'),
            TextButton(
                onPressed: (){
                  Navigator.pop(context,'我是返回值');
                },
                child: const Text('返回')
            )
          ],
        ),
      ),
    );
  }
}
