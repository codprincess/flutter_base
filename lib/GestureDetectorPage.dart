import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  const GestureDetectorPage({Key? key}) : super(key: key);

  @override
  State<GestureDetectorPage> createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  double _width = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GestureDetector'),),
      body: Center(
        child: Column(
          children: [
            // GestureDetector(
            //   onTapDown: (TapDownDetails details){
            //     print('按下时回调');
            //   },
            //   onTapUp: (TapUpDetails details){
            //     print('抬起时回调');
            //   },
            //   onTap: () {
            //     print('点击');
            //   },
            //   onTapCancel: (){
            //     print('点击取消事件回调');
            //   },
            //   child: Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.green,
            //   ),
            // ),
            GestureDetector(
              onDoubleTap: (){
                print('双击');
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            GestureDetector(
              onLongPressStart: (e)=>print('onLongPressStart'),
              onLongPressMoveUpdate: (e) => print('onLongPressMoveUpdate'),
              onLongPressUp: ()=>print('onLongPressUp'),
              onLongPressEnd: (e)=>print('onLongPressEnd'),
              onLongPress: ()=>print('onLongPress'),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.pink,
              ),
            ),
            GestureDetector(
              onVerticalDragStart: (v) => print('onVerticalDragStart'),
              onVerticalDragDown: (v) => print('onVerticalDragDown'),
              onVerticalDragUpdate: (v) => print('onVerticalDragUpdate'),
              onVerticalDragCancel: () => print('onVerticalDragCancel'),
              onVerticalDragEnd: (v) => print('onVerticalDragEnd'),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            GestureDetector(
              onPanDown: (DragDownDetails details){
                print('用户手指按下');
              },
              onPanUpdate: (DragUpdateDetails details){
                print('手指滑动时会触发此回调');
              },
              onPanEnd: (DragEndDetails details){
                print('结束');
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
              ),
            ),

            GestureDetector(
              child: Image.asset('images/liu.webp',width: _width,),
              onScaleUpdate: (ScaleUpdateDetails details){
                print(details);
                setState(() {
                  //缩放倍数在0.8到10倍之间
                  _width = 200*details.scale.clamp(.8, 10);
                });
              },
            )


          ],
        ),
      )
    );
  }
}
