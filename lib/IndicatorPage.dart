// import 'package:ele_progress/ele_progress.dart';
// import 'package:flutter/material.dart';
//
// class IndicatorPage extends StatefulWidget {
//   const IndicatorPage({Key? key}) : super(key: key);
//
//   @override
//   State<IndicatorPage> createState() => _IndicatorPageState();
// }
//
// class _IndicatorPageState extends State<IndicatorPage> {
//   bool _isShow = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('进度指示器'),),
//       body: Column(
//         children: [
//           Container(
//             width: 400,
//             padding: EdgeInsets.all(30.0),
//             child: EProgress(
//                 progress: 50,
//               strokeWidth: 20,
//             )
//           ),
//           Container(
//               width: 400,
//               padding: const EdgeInsets.all(30.0),
//               child: EProgress(
//                 progress: 50,
//                 strokeWidth: 20,
//                 colors: [
//                   Colors.blue,
//                   Colors.red,
//                   Colors.green,
//                 ],
//               )
//           ),
//           SizedBox(height: 40,),
//           Container(
//               width: 400,
//               padding: const EdgeInsets.all(30.0),
//               child: EProgress(
//                 progress: 100,
//                 strokeWidth: 50,
//                 textInside: true,
//                 direction: Axis.vertical,
//                 //backgroundColor: Colors.grey,
//                 textStyle: TextStyle(color: Colors.red),
//               )
//           ),
//
//
//         ],
//       ),
      // bottomSheet: BottomSheet(
      //   enableDrag: false,
      //   onClosing: (){},
      //   builder: (context){
      //     return Container(
      //       color: Colors.cyan,
      //       height: 200,
      //       alignment: Alignment.center,
      //       child: const Text('BottomSheet'),
      //     );
      //   },
      // ),
      //floatingActionButton: _buildFloatingActionButton(),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.radar),
      //   onPressed: (){
      //     showModalBottomSheet(
      //         context: context,
      //         builder: (context){
      //           return Container(
      //             height: 100,
      //             child: Column(
      //               children: [
      //                 TextButton(
      //                     onPressed: (){
      //                       Navigator.of(context).pop();
      //                     },
      //                     child: const Text('保存'),
      //                 ),
      //                 TextButton(
      //                   onPressed: (){
      //                     Navigator.of(context).pop();
      //                   },
      //                   child: const Text('取消'),
      //                 ),
      //               ],
      //             )
      //           );
      //         }
      //     );
      //   },
      // ),














//     );
//   }
//   Widget _buildFloatingActionButton(){
//     return Builder(
//         builder: (context){
//           return FloatingActionButton(
//               onPressed: (){
//                 _floatingActionButtonEvent(context);
//                 _isShow = !_isShow;
//               },
//               child: const Icon(Icons.ac_unit_sharp),
//           );
//         }
//     );
//   }
//
//   _floatingActionButtonEvent(BuildContext context){
//     if(_isShow){
//       Navigator.of(context).pop();
//     }else{
//       _showSheet(context);
//     }
//   }
//   void _showSheet(BuildContext context){
//     showBottomSheet(
//         context: context,
//         builder: (context){
//           return Container(
//             width: double.infinity,
//             height: 200,
//             color: Colors.green,
//             alignment: Alignment.center,
//             child: const Text('showBottomSheet'),
//           );
//         }
//     );
//   }
//
// }
