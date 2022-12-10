import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedOpacity'),),
      body: Column(
        children: [
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 3),
            curve: Curves.easeIn,
            child: Image.asset('images/liu.webp',width: double.infinity,height: 200, fit: BoxFit.cover,),
          ),
          
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 3),
            curve: Curves.elasticInOut,
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.amber,
              child: const Center(
                child: Text('Flutter'),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 3),
            curve: Curves.fastOutSlowIn,
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.blue,
              child: const Center(
                child: Text('Tehub'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _opacity = _opacity == 0 ? 1 : 0;
          });
        },
        child: Text(_opacity==0?'显示':'隐藏'),
      ),
    );
  }
}
