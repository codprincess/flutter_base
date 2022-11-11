import 'package:flutter/material.dart';

class WillPopScopePage extends StatelessWidget {
  const WillPopScopePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('询问是否退出'),),
      // body: AskPage()
    );
  }

}





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


