import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModelOne with ChangeNotifier{
  String name = '张三';
  void changeName (){
    name = '李四';
    notifyListeners();
  }
}

class UserModelTwo with ChangeNotifier{
  String name = '张三';
  int age = 18;
  void changeName(){
    name = '李四';
    age = 20;
    notifyListeners();
  }
}


class ProviderPage3 extends StatefulWidget {
  const ProviderPage3({Key? key}) : super(key: key);

  @override
  State<ProviderPage3> createState() => _ProviderPage3State();
}

class _ProviderPage3State extends State<ProviderPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MultiProvider'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserModelOne>(
              builder: (_,userModel,child){
                return Text(userModel.name,style: const TextStyle(
                  color: Colors.red,
                  fontSize: 30
                ),);
              }
            ),
            Consumer<UserModelTwo>(
              builder: (_,userModel,child){
                return Text(userModel.age.toString(),style: const TextStyle(
                  color: Colors.green,
                  fontSize: 30
                ),);
              }
            ),
            Consumer2<UserModelOne,UserModelTwo>(
              builder: (_,userModelOne,userModelTwo,child){
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: (){
                      userModelOne.changeName();
                      userModelTwo.changeName();
                    },
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
