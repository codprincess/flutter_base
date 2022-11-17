import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModelThree with ChangeNotifier{
  String name = '张三';
  void changeName({required String newName}){
    name = newName;
    notifyListeners();
  }
}

class WalletModel{
  UserModelThree? userModelThree;
  WalletModel({this.userModelThree});
  void changeName(){
    userModelThree?.changeName(newName: '王五');
  }
}

class ProxyProviderPage extends StatefulWidget {
  const ProxyProviderPage({Key? key}) : super(key: key);

  @override
  State<ProxyProviderPage> createState() => _ProxyProviderPageState();
}

class _ProxyProviderPageState extends State<ProxyProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('ProxyProvider'),),
      body: Center(
        child: Column(
          children: [
            Consumer<UserModelThree>(
              builder: (_,userModel,child){
                return Text(userModel.name,style: const TextStyle(
                  color: Colors.red,
                  fontSize: 30
                ),);
              }
            ),
            Consumer<UserModelThree>(
                builder: (_,userModel,child){
                 return Padding(
                   padding: const EdgeInsets.all(20),
                   child: ElevatedButton(
                     onPressed: (){
                       userModel.changeName(newName: '李四');
                     },
                     child: const Text('改变值'),
                   ),
                 );
                }
            ),
            Consumer<WalletModel>(
                builder: (_,walletModel,child){
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: (){
                        walletModel.changeName();
                      },
                      child: const Text('通过代理改变值'),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
