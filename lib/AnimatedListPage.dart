import 'dart:math';
import 'package:flutter/material.dart';
class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({Key? key}) : super(key: key);

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final _items = [];
  final _key = GlobalKey<AnimatedListState>();
  //添加
  void _addItem() {
    _items.insert(0, 'Item ${_items.length + 1}');
    _key.currentState!.insertItem(0,duration: const Duration(seconds: 1));
  }
  //删除
  void _removeItem(int index){
    _key.currentState!.removeItem(index, (context, animation)  {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin:  EdgeInsets.all(10),
          elevation: 10,
          color: Colors.purple,
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
            title: Text('删除'),
          ),
        )
      );
    },duration: const Duration(seconds: 1));
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('使用key的方法'),),
      body: AnimatedList(
        key: _key,
        initialItemCount: 0,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context,index,animation){
          return SizeTransition(
            sizeFactor: animation,
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 10,
              color: Colors.orange,
              child: ListTile(
                contentPadding: const EdgeInsets.all(15),
                title: Text(_items[index]),
                trailing: IconButton(
                  icon:const Icon(Icons.delete),
                  onPressed: ()=>_removeItem(index),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,child: const Icon(Icons.add),
      ),
    );
  }
}

// class AnimatedListPage extends StatefulWidget {
//   const AnimatedListPage({Key? key}) : super(key: key);
//
//   @override
//   State<AnimatedListPage> createState() => _AnimatedListPageState();
// }
//
// class _AnimatedListPageState extends State<AnimatedListPage> {
//   final _items = ["Item 0"];
//   final _key = GlobalKey<AnimatedListState>();
//   //添加
//   void _addItem() {
//     _items.insert(0, 'Item ${_items.length + 1}');
//     _key.currentState!.insertItem(0,duration: const Duration(seconds: 1));
//   }
//   //删除
//   void _removeItem(int index,BuildContext context) {
//     AnimatedList.of(context).removeItem(index, (context, animation) {
//       return FadeTransition(
//           opacity: animation,
//           child: SizeTransition(
//             sizeFactor: animation,
//             child: SizedBox(
//               height: 150,
//               child: Card(
//                 margin: const EdgeInsets.symmetric(vertical: 20),
//                 elevation: 10,
//                 color: Colors.red[400],
//                 child: const Center(
//                   child: Text('list',style: TextStyle(fontSize: 28),),
//                 ),
//               ),
//             ),
//           ),
//       );
//     } ,duration: const Duration(seconds: 1));
//     _items.removeAt(index);
//   }
//  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AnimatedList.of'),
//         actions: [
//           IconButton(
//               onPressed: _addItem,
//               icon: const Icon(Icons.plus_one_outlined),
//           )
//         ],
//       ),
//       body: AnimatedList(
//         key: _key,
//         initialItemCount: 1,
//         padding: const EdgeInsets.all(10),
//         itemBuilder: (context,index, animation){
//           return SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(-1, -0.5),
//                 end:const Offset(0, 0),
//               ).animate(animation),
//               child: RotationTransition(
//                 turns: animation,
//                 child: SizeTransition(
//                   axis: Axis.vertical,
//                   sizeFactor: animation,
//                   child: SizedBox(
//                     height: 150,
//                     child: InkWell(
//                       onTap: ()=>_removeItem(index, context),
//                       child: Card(
//                         margin: const EdgeInsets.symmetric(vertical: 20),
//                         elevation: 10,
//                         color: Colors.primaries[(index*100)% Colors.primaries.length][300],
//                         child: Center(
//                           child: Text(_items[index],style: const TextStyle(fontSize: 28),),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           );
//         },
//       ),
//     );
//   }
// }

// class AnimatedListPage extends StatefulWidget {
//   const AnimatedListPage({Key? key}) : super(key: key);
//
//   @override
//   State<AnimatedListPage> createState() => _AnimatedListPageState();
// }
//
// class _AnimatedListPageState extends State<AnimatedListPage> {
//
//  var data = [1,2,3,4,5,6];
//   final globalkey = GlobalKey<AnimatedListState>();
//   final _tween = Tween<Offset>(begin: Offset(1,0),end: Offset(0,0));
//   @override
//   void initState() {
//     // TODO: implement initState
//     //data = [1,2,3,4,5,6];
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('AnimatedLis'),),
//       body: Stack(
//         children:[
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.0),
//             child: AnimatedList(
//               key: globalkey,
//               initialItemCount: data.length,
//               itemBuilder: (BuildContext context,int index,Animation animation){
//                  return buildItem(data[index].toString(),animation);
//               },
//             ),
//           ),
//           Positioned(
//             bottom: 30,
//             right: 10,
//             child: FloatingActionButton(
//               heroTag: 'remove',
//               onPressed: (){
//                 int key = data.last;
//                 int index = data.length -1;
//                 data.remove(key);
//                 globalkey.currentState?.removeItem(index, (context, animation) => buildItem(key.toString(), animation),duration: Duration(seconds: 1));
//               },
//               child: const Icon(Icons.remove),
//             )
//           ),
//           Positioned(
//               bottom: 30,
//               right: 70,
//               child: FloatingActionButton(
//                 heroTag: 'add',
//                 onPressed: (){
//                   int num = Random().nextInt(1000);
//                   data.add(num);
//                   int index = data.lastIndexOf(num);
//                   globalkey.currentState?.insertItem(index,duration: Duration(seconds: 1));
//                 },
//                 child: const Icon(Icons.add),
//               )
//           ),
//
//         ]
//       ),
//     );
//   }
//   Widget buildItem(String text, Animation animation){
//     return SlideTransition(
//        position: animation.drive(CurveTween(curve: Curves.bounceOut)).drive(_tween),
//        child: Container(
//          margin: const EdgeInsets.symmetric(vertical: 10.0),
//          constraints: BoxConstraints.tight(const Size(double.infinity,70)),
//          alignment: Alignment.center,
//          color: Colors.primaries[int.parse(text) % Colors.primaries.length],
//          child: Text(text,style: const TextStyle(color: Colors.white),),
//        ),
//     );
//
//   }
//



// }


