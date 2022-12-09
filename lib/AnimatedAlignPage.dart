import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  const AnimatedAlignPage({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignPage> createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  bool animatePosition = false;
  Alignment currentAlignment = Alignment.topLeft;
  Alignment resultAlignment = Alignment.topLeft;
  int sensitivity = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedAlign'),),
      body: AnimatedAlign(
        alignment: animatePosition ? resultAlignment : currentAlignment,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: GestureDetector(
          onHorizontalDragUpdate: (details){
            if(details.delta.dx > sensitivity){
              setState(() {
                animatePosition = true;
                if(resultAlignment == Alignment.topLeft){
                  resultAlignment = Alignment.topRight;
                }else{
                  resultAlignment = Alignment.bottomRight;
                }
              });
            }else if(details.delta.dx < -sensitivity){
              setState(() {
                animatePosition = true;
                if(resultAlignment == Alignment.topRight){
                  resultAlignment = Alignment.topLeft;
                }else{
                  resultAlignment = Alignment.bottomLeft;
                }
              });
            }
          },
          onVerticalDragUpdate: (details){
            if(details.delta.dy > sensitivity){
              setState(() {
                animatePosition = true;
                if(resultAlignment == Alignment.topLeft){
                  resultAlignment = Alignment.bottomLeft;
                }else{
                  resultAlignment = Alignment.bottomRight;
                }
              });
            }else if(details.delta.dy < -sensitivity){
              setState(() {
                animatePosition = true;
                if (resultAlignment == Alignment.bottomLeft) {
                  resultAlignment = Alignment.topLeft;
                } else if (resultAlignment == Alignment.bottomRight) {
                  resultAlignment = Alignment.topRight;
                }
              });
            }
          },
          child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),
        ),
      )


    );
  }
}


class Epx extends StatefulWidget {
  const Epx({Key? key}) : super(key: key);

  @override
  State<Epx> createState() => _EpxState();
}

class _EpxState extends State<Epx> {
  bool animatePosition = false;
  Alignment currentAlignment = Alignment.topLeft;
  late Alignment resultAlignment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedAlign'),),
      body: Container(
        child:  AnimatedAlign(
          alignment: animatePosition ? resultAlignment: currentAlignment,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    animatePosition = true;
                    resultAlignment = Alignment.topLeft;
                  });
                },
                child: const Text('topLeft'),
              )
          ),
          Expanded(
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    animatePosition = true;
                    resultAlignment = Alignment.topRight;
                  });
                },
                child: const Text('topRight'),
              )
          ),
          Expanded(
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    animatePosition = true;
                    resultAlignment = Alignment.topCenter;
                  });
                },
                child: const Text('topCenter'),
              )
          ),

        ],
      ),
    );
  }
}



