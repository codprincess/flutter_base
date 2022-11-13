
import 'package:flutter/material.dart';
class WillPopScopePage extends StatefulWidget {
  const WillPopScopePage({Key? key}) : super(key: key);

  @override
  State<WillPopScopePage> createState() => _WillPopScopePageState();
}

class _WillPopScopePageState extends State<WillPopScopePage> {
  DateTime? _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(_lastPressedAt == null || DateTime.now().difference(_lastPressedAt!)>Duration(seconds: 1)){
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('连续点击退出'),),
        body: Container(
          alignment: Alignment.center,
          child: const Text('1秒内连续两次按返回按钮则退出'),
        ),
      )
    );
  }
}

// class WillPopScopePage extends StatefulWidget {
//   const WillPopScopePage({Key? key}) : super(key: key);
//
//   @override
//   State<WillPopScopePage> createState() => _WillPopScopePageState();
// }
// class _WillPopScopePageState extends State<WillPopScopePage> {
//   Future<bool?> _onBackPressed(BuildContext context) async{
//     return showDialog(
//         context: context,
//         builder: (BuildContext context){
//           return  AlertDialog(
//             title: const Text('确定要退出吗？'),
//             actions: [
//               TextButton(
//                   onPressed: (){
//                     Navigator.of(context).pop(false);
//                   },
//                   child: const Text('取消')
//               ),
//               TextButton(
//                   onPressed: (){
//                     print('1111');
//                     Navigator.of(context).pop(true);
//                   },
//                   child: const Text('确定')
//               )
//             ],
//           );
//         }
//     );
//   }
//  
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async{
//         bool? result = await _onBackPressed(context);
//         result ??= false; //判断是否为null，是就赋值false
//         return result;
//       },
//       child: Scaffold(
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Stack(
//                   children: [
//                     Positioned(
//                         child: AppBar(
//                           centerTitle: true,
//                           title:const Text(
//                             'Sample',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           backgroundColor: Colors.transparent,
//                           elevation: 0,
//                           leading: IconButton(
//                             icon: const Icon(Icons.arrow_back,color: Colors.black,size: 30,),
//                             onPressed: (){_onBackPressed(context);},
//                           ),
//                         )
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





// class AskPage extends StatefulWidget {
//   const AskPage({Key? key}) : super(key: key);
//
//   @override
//   State<AskPage> createState() => _AskPageState();
// }
//
// class _AskPageState extends State<AskPage> {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return showDialog(
//             context: context,
//             builder: (BuildContext context){
//               return AlertDialog(
//                 title: Text('确定要退出？'),
//                 actions: [
//                   TextButton(onPressed: (){Navigator.of(context).pop(true);}, child: const Text('确定')),
//                   TextButton(onPressed: (){Navigator.of(context).pop(false);}, child: const Text('取消'))
//                 ],
//               );
//             }
//         );
//         // return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(title: const Text('询问'),),
//         body: Container(
//           alignment: Alignment.center,
//           child: const Text('点击后退按钮，询问是否退出'),
//         ),
//       ),
//     );
//   }
// }







// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(centerTitle: true,title: const Text('WillPopScope'),),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Go to OtherPage'),
//           onPressed: (){
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (context)=>const OtherPage())
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// // OtherPage
// class OtherPage extends StatelessWidget {
//   const OtherPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         //弹出
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('系统后退按钮已停用'))
//         );
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(title: const Text('OtherPage'),centerTitle: true,),
//         body: const Padding(
//           padding: EdgeInsets.all(30),
//           child: Text('禁止退出'),
//         ),
//       )
//     );
//   }
// }


