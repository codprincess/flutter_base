import 'package:flutter/material.dart';
import 'package:flutter_base/ChangeNotifierProxyProviderPage.dart';
import 'package:flutter_base/ProviderPage.dart';
import 'package:flutter_base/ProviderPage2.dart';
import 'package:flutter_base/ProviderPage3.dart';
import 'package:flutter_base/ProxyProviderPage.dart';
import 'package:flutter_base/model/BookManagerModel.dart';
import 'package:provider/provider.dart';

void main() => runApp( MyApp());
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        Provider(create: (_) => BookModel()),
        ChangeNotifierProxyProvider<BookModel,BookManagerModel>(
          create: (_) => BookManagerModel(BookModel()),
          update: (_,bookModel,bookManagerModel)=> BookManagerModel(bookModel)
        )
      ],
      child: const MaterialApp(
        home: ChangeNotifierProxyProviderPage(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context){
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider<UserModelThree>(create: (_) => UserModelThree()),
//           ProxyProvider<UserModelThree,WalletModel>(
//               update: (_,userModelThree,walletModel) => WalletModel(userModelThree: userModelThree)
//           )
//         ],
//         child: const MaterialApp(
//           home: ProxyProviderPage(),
//         ),
//     );
//   }
// }

// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context){
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<UserModelOne>(create: (_) => UserModelOne()),
//         ChangeNotifierProvider<UserModelTwo>(create: (_) => UserModelTwo())
//       ],
//       child: const MaterialApp(
//         home: ProviderPage3(),
//       ),
//     );
//   }
// }


// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context){
//     return ChangeNotifierProvider<UserModelOne>(
//       create: (_) => UserModelOne(),
//       child: ChangeNotifierProvider<UserModelTwo>(
//         create: (_) => UserModelTwo(),
//         child: const MaterialApp(
//           home: ProviderPage3(),
//         ),
//       )
//     );
//   }
// }

// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context){
//     return ChangeNotifierProvider<UserModel>(
//       create: (_) => UserModel(),
//       child: const MaterialApp(
//         home: ProviderPage2(),
//       ),
//     );
//   }
// }


// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context){
//     return ChangeNotifierProvider(
//       create: (_)=>CountNotifier(),
//       child: const MaterialApp(
//         home: ProviderPage(),
//       ),
//     );
//   }
// }