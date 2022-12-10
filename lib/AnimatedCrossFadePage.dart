import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  const AnimatedCrossFadePage({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadePage> createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool showPost = false;//渲染
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedCrossFade'),),
      body: Center(
        child: AnimatedCrossFade(
          firstChild: GestureDetector(
            onTap: (){
              setState(() {
                showPost = true;
              });
            },
            child: Container(
              width: 300,
              height: 400,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('第一个widget',style: TextStyle(fontSize: 30,color: Colors.white),),
                  const SizedBox(height: 200,),
                  OutlinedButton(
                    onPressed: (){
                      setState(() {
                        showPost = true;
                      });
                    },
                    child: const Text('点击淡出'),
                  )
                ],
              ),
            ),
          ),
          secondChild: GestureDetector(
            onTap: (){
              setState(() {
                showPost = false;
              });
            },
            child: Container(
              width: 400,
              height: 500,
              color: Colors.blueGrey,
              child: Image.asset('images/liu.webp'),
            ),
          ),
          duration: const Duration(seconds: 1),
          crossFadeState: !showPost ? CrossFadeState.showFirst: CrossFadeState.showSecond,
          layoutBuilder: (topChild,topChildKey,bottomChild, bottomChildKey){
            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  key: bottomChildKey,
                  top: 0.0,
                  child: bottomChild,
                ),
                Positioned(
                  key: topChildKey,
                  child: topChild,
                ),
              ],
            );
          },
        ),
        
      ),
    );
  }
}
