import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}
class ChatMessage {
  ChatMessage({required this.username,required this.message});
  String username;
  String message;
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  final List<ChatMessage> _chatMessages = [];
  Stream<ChatMessage> _chat() async* {
    await Future<void>.delayed(const Duration(seconds: 0));
    yield ChatMessage(username: 'hedy', message: "你好");

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(username: "jing", message: "干嘛");

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(username: "hedy", message: "一起学习吗?");

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(username: "jing", message: "好呀，手把手教学吗?");

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(username: "hedy", message: "上Tehub社区学习！！！！");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StreamBuilder'),),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: StreamBuilder(
          stream: _chat(),
          builder: (BuildContext context, AsyncSnapshot<ChatMessage> snapshot){
            if(snapshot.hasData){
              _chatMessages.add(snapshot.data!);
              return ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context,index){
                  final ChatMessage chatItem = _chatMessages[index];
                  return ListTile(
                    leading: Text(chatItem.username,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                    title: Text(chatItem.message,style: TextStyle(
                      fontSize: 22,
                      color: chatItem.username == 'hedy' ? Colors.pink : Colors.blue,
                    ),),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}


// class StreamBuilderPage extends StatefulWidget {
//   const StreamBuilderPage({Key? key}) : super(key: key);
//
//   @override
//   State<StreamBuilderPage> createState() => _StreamBuilderPageState();
// }
//
// //使用StreamBuilder首先需要构建一个Stream
// //要使用 Streams，我们必须创建函数异步生成器 ( async* )
// //async*函数一次返回多个未来值,当调用此函数时，将创建Stream。现在要从这个函数返回数据，我们必须使用yieldor yield*。
// //yield类似于return，但不同之处在于yield不会立即终止函数
// Stream<int> generateNumbers = (() async* {
//   await Future<void>.delayed(const Duration(seconds: 2));
//   for(int i = 10;i >0;i--){
//     await Future<void>.delayed(const Duration(seconds: 1));
//     yield i;
//   }
// })();
//
// class _StreamBuilderPageState extends State<StreamBuilderPage> {
//   //创建单订阅流StreamController
//   StreamController<double> _streamController = StreamController();
//   //计时器
//   late Timer _timer ;
//   //倒计时10
//   double totalTimeNum = 10000;
//   //当前时间
//   double currentTimeNum = 10000;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       //开启定时器
//       startTimer();
//     });
//   }
//
//   void startTimer(){
//     _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
//       currentTimeNum -= 100;
//       if(currentTimeNum <= 0){
//         _timer.cancel();
//         currentTimeNum = 0;
//       }
//       //流数据更新
//       _streamController.add(currentTimeNum);
//     });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     //关闭
//     _streamController.close();
//     _timer.cancel();//计时器一旦执行了 cancel 方法后，就不可以再次重新覆用
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('StreamBuilder'),),
//       body: SizedBox(
//         width: double.infinity,
//         child: Center(
//           child: StreamBuilder<double>(
//             stream: _streamController.stream,
//             initialData: 10,
//             builder: (BuildContext context,AsyncSnapshot<double> snapshot){
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CircularProgressIndicator(),
//                   Visibility(
//                     visible: snapshot.hasData,
//                     child: Text((snapshot.data! / 1000).toStringAsFixed(0),style: const TextStyle(
//                       color: Colors.black,fontSize: 25
//                     ),)
//                   )
//                 ],
//               );
//             },
//           ),
//           // child: StreamBuilder<int>(
//           //   stream: generateNumbers,
//           //   initialData: 10,
//           //   builder: (BuildContext context,AsyncSnapshot<int> snapshot){
//           //     if(snapshot.connectionState == ConnectionState.waiting){
//           //       return Column(
//           //         crossAxisAlignment: CrossAxisAlignment.center,
//           //         mainAxisAlignment: MainAxisAlignment.center,
//           //         children: [
//           //           const CircularProgressIndicator(),
//           //           Visibility(
//           //             visible: snapshot.hasData,
//           //             child: Text(snapshot.data.toString(),style: const TextStyle(
//           //               color: Colors.black,fontSize: 25
//           //             ),)
//           //           )
//           //         ],
//           //       );
//           //     }else if(snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){
//           //       if(snapshot.hasError){
//           //         return const Text('Error');
//           //       }else if(snapshot.hasData){
//           //         return Text(snapshot.data.toString(),style: const TextStyle(
//           //             color: Colors.red,fontSize: 25
//           //         ),);
//           //       }else{
//           //         return const Text('Empty data');
//           //       }
//           //     }else{
//           //       return Text('State: ${snapshot.connectionState}');
//           //     }
//           //   },
//           // ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child:const Text('开始倒计时'),
//         onPressed: (){
//           currentTimeNum = totalTimeNum;
//           if(!_timer.isActive){
//             startTimer();
//           }
//         },
//       ),
//     );
//   }
// }
