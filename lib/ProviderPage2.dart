import 'package:flutter/material.dart';

class UserModel{
  String name = "张三";
  void changeName(){
    name = "李四";
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

    );
  }
}

