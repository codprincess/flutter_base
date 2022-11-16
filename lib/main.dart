import 'package:flutter/material.dart';
import 'package:flutter_base/ProviderPage.dart';
import 'package:provider/provider.dart';

void main() => runApp( MyApp());
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return Provider(
      create: create
    )
  }
  // Widget build(BuildContext context){
  //   return ChangeNotifierProvider(
  //     create: (_)=>CountNotifier(),
  //     child: const MaterialApp(
  //       home: ProviderPage(),
  //     ),
  //   );
  // }
}