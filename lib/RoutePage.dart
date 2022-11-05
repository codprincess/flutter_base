import 'package:flutter/material.dart';
import 'package:flutter_base/RoutePageB.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //打开新的路由，并返回具体的值
    Future<Object?> openBackTap(){
      return Navigator.pushNamed(context, 'RoutePageB',arguments: '从RoutePage传过来');
    }
    return Scaffold(
      appBar: AppBar(title: const Text('路由传值'),),
      body:  Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              TextButton(
                  onPressed: openBackTap,
                  child: const Text('open new page')
              ),

            ],
          ),
        ),
      ),
    );
  }
}
