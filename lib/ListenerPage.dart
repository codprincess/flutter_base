import 'package:flutter/material.dart';

class ListenerPage extends StatefulWidget {
  const ListenerPage({Key? key}) : super(key: key);

  @override
  State<ListenerPage> createState() => _ListenerPageState();
}

class _ListenerPageState extends State<ListenerPage> {
  //创建两个整型变量， _down 和 _up 都为零
  int _down = 0;
  int _up = 0;
  //创建另外两个双精度变量 x 和 y 等于零
  double x = 0.0;
  double y = 0.0;
  //创建_updateLocation()方法
  void _updateLocation(PointerEvent details){
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }
  //创建_incrementDown()方法,调用_updateLocation()方法
  void _incrementDown(PointerEvent details){
    _updateLocation(details);
    setState(() {
      _down++;
    });
  }
  //创建_incrementUp()方法,调用_updateLocation()方法
  void _incrementUp(PointerEvent details){
    _updateLocation(details);
    setState(() {
      _up++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listener'),),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(const Size(360, 300)),
          child: Listener(
            onPointerDown: _incrementDown,
            onPointerMove: _updateLocation,
            onPointerUp: _incrementUp,
            child: Container(
              color: Colors.orange[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('按下或者释放'),
                  const SizedBox(height: 20,),
                  Text('$_down \n $_up'),
                  const SizedBox(height: 20,),
                  Text('光标:(${x.toStringAsFixed(2)},${y.toStringAsFixed(2)})å'),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
