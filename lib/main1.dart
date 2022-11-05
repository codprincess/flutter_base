import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),

    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.push(context,  MaterialPageRoute(builder: (context) {
        return MyHomePage(title: '启动页',);
      }),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png',height: 200,width: 200,),
            const SizedBox(height: 30,),
            if(Platform.isIOS)
             const CupertinoActivityIndicator(
                radius: 20,
              )
            else
              const CircularProgressIndicator(
                color: Colors.white,
              )

          ],
        ),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  <Widget>[
            const Text('点击按钮跳转到相应页面',style: TextStyle(fontSize: 20.0),),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'text_page');
              },
              child: const Text('文本及样式'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'image_page');
              },
              child: const Text('图片加载'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'from_page');
              },
              child: const Text('表单'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'from_radio');
              },
              child: const Text('表单之radio实例'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'login_page');
              },
              child: const Text('登录表单实例'),
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'layout_page');
              },
              child: const Text('布局约束'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'row_page');
              },
              child: const Text('布局方式Row Column'),
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'padding_page');
              },
              child: const Text('容器类组件'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'app_page');
              },
              child: const Text('导航栏'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'bottomappbar_page');
              },
              child: const Text('BottomAppBar'),
            ),



          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

