import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('线性布局'),),
      // body: Container(
      //   child: Column(
      //     children: [
      //       //Flex的两个子widget按1：2来占据水平空间
      //       Flex(
      //         direction: Axis.horizontal,
      //         children: [
      //           Expanded(
      //             flex: 1,
      //             child: Container(
      //               height: 30,
      //               color: Colors.pink,
      //             )
      //           ),
      //           Expanded(
      //               flex: 2,
      //               child: Container(
      //                 height: 30,
      //                 color: Colors.green,
      //               )
      //           ),
      //         ],
      //       ),
      //
      //       Padding(
      //         padding: const EdgeInsets.only(top: 20),
      //         child: SizedBox(
      //           height: 100,
      //           //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
      //           child:Flex(
      //             direction: Axis.vertical,
      //             children: [
      //               Expanded(
      //                 flex: 2,
      //                 child: Container(
      //                   height: 30.0,
      //                   color: Colors.red,
      //                 )
      //               ),
      //               Spacer(flex: 1,),
      //               Expanded(
      //                   flex: 1,
      //                   child: Container(
      //                     height: 30.0,
      //                     color: Colors.purple,
      //                   )
      //               ),
      //
      //             ],
      //           ) ,
      //         ),
      //       ),
      //
      //       Wrap(
      //         spacing: 8.0,//主轴(水平)方向间距
      //         runSpacing: 4.0,//纵轴方向间距
      //         alignment: WrapAlignment.center,//沿主轴
      //         children: const [
      //           Chip(
      //             label: Text('First-First'),
      //             avatar: CircleAvatar(backgroundColor: Colors.green,child: Text('A'),),
      //           ),
      //           Chip(
      //             label: Text('Two-Two'),
      //             avatar: CircleAvatar(backgroundColor: Colors.green,child: Text('B'),),
      //           ),
      //           Chip(
      //             label: Text('Three-Three'),
      //             avatar: CircleAvatar(backgroundColor: Colors.green,child: Text('C'),),
      //           ),
      //           Chip(
      //             label: Text('Four-Four'),
      //             avatar: CircleAvatar(backgroundColor: Colors.green,child: Text('D'),),
      //           ),
      //         ],
      //       ),
      //       Stack(
      //
      //       ),
      //       Positioned(
      //         child: child
      //       )
      //     ],
      //   ),
      //
      // ),
      // body: ConstrainedBox(
      //   constraints: BoxConstraints.expand(),
      //   child: Stack(
      //     alignment: Alignment.center,//指定未定位或部分定位widget的对齐方式
      //     fit: StackFit.expand,//未定位widget占满Stack整个空间
      //     children: [
      //
      //       const Positioned(child:Text('一起来学习flutter'),left: 20.0,),
      //       Container(
      //         color: Colors.red,
      //         child: const Text('你好',style: TextStyle(color: Colors.white),),
      //       ),
      //       const Positioned(child: Text('快速学习'),top: 10,)
      //     ],
      //   ),
      // ),
      body: Container(
        color: Colors.green.shade50,
        height: 120.0,
        width: 120.0,
        child: const Align(
          alignment: FractionalOffset(0.2, 0.6),
          child: FlutterLogo(
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
