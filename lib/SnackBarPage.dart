import 'package:flutter/material.dart';

class SnackBarPage extends StatefulWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  State<SnackBarPage> createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 5),//设置显示时间
                      content: const Text('一起学习flutter',style: TextStyle(color: Colors.white),),
                      elevation: 6,
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  )
                );
              },
              child: const Text('弹出消息')
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: const [
                          Icon(Icons.upcoming,color: Colors.blue,),
                          Text('正在下载')
                        ],
                      ),
                    )
                  );
                },
                child: const Text('弹出消息2')
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: const [
                            Icon(Icons.upcoming,color: Colors.blue,),
                            Text('正在下载')
                          ],
                        ),
                        behavior: SnackBarBehavior.floating,
                      )
                  );
                },
                child: const Text('弹出消息3')
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                          label: '确定',
                          onPressed: (){
                            print('11111');
                          },
                        ),
                        content: const Text('处理用户点击事件'),
                        behavior: SnackBarBehavior.floating,
                      )
                  );
                },
                child: const Text('弹出消息4')
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  List.generate(8, (index) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                          label: '确定',
                          onPressed: (){
                            print('11111');
                          },
                        ),
                        content:  Text('消息：$index'),
                      )
                  ));
                },
                child: const Text('点击依次弹出SnackBar')
            ),







          ],
        ),
      )
    );
  }
}
