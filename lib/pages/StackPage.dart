import 'package:flutter/material.dart';

// class StackPage extends StatelessWidget {
//   const StackPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Stack'),),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Center(
//           // child: Stack(
//           //   alignment: AlignmentDirectional.center,
//           //   children: [
//           //     Container(
//           //       width: 250,
//           //       height: 250,
//           //       color: Colors.amber,
//           //     ),
//           //     Container(
//           //       width: 100,
//           //       height: 400,
//           //       color: Colors.purple,
//           //     ),
//           //     Container(
//           //       width: 400,
//           //       height: 100,
//           //       color: Colors.red,
//           //     ),
//           //   ],
//           // ),
//         ),
//       ),
//     );
//   }
// }
class StackPage extends StatefulWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack'),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: IndexedStack(
            index: index,
            children: [
              // index = 0
              Container(
                width: 400,
                height: 400,
                color: Colors.amber,
                alignment: Alignment.center,
                child: const Text('0',style: TextStyle(fontSize: 50),),
              ),
              // index = 1
              Container(
                width: 400,
                height: 400,
                color: Colors.purple,
                alignment: Alignment.center,
                child: const Text('1',style: TextStyle(fontSize: 50),),
              ),
              // index = 2
              Container(
                width: 400,
                height: 400,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text('2',style: TextStyle(fontSize: 50),),
              )

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh_rounded),
        onPressed: (){
          setState(() {
            if(index == 2){
              index = 0;
            }else{
              index = index + 1;
            }
          });
        },
      ),
    );
  }
}




