import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModel with ChangeNotifier{
  String name = "张三";
  void changeName(){

    print('22222');
    name = "李四";
    notifyListeners();
  }
}

class ProviderPage2 extends StatefulWidget {
  const ProviderPage2({Key? key}) : super(key: key);

  @override
  State<ProviderPage2> createState() => _ProviderPage2State();
}

class _ProviderPage2State extends State<ProviderPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserModel>(
              builder: (_,userModel,child){
                //取值
                return Text(userModel.name,style: TextStyle(color: Colors.red,fontSize: 30),);
              }
            ),
            Consumer<UserModel>(
              builder: (_,userModel,child){
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    //调用方法
                    onPressed: (){userModel.changeName();},
                    child: const Text('改变值'),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

