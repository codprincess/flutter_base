import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  // late AnimationController _controller;
  // late Animation<double> _animation;
  // //用户点击时启动动画
   bool isAnimating = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _controller = AnimationController(
  //       duration: const Duration(milliseconds: 500),
  //       vsync: this
  //   )..repeat(reverse: true);
  //   final curvedAnimation = CurvedAnimation(
  //       parent: _controller,
  //       curve: Curves.fastOutSlowIn
  //   );
  //   //通过Tween来生成不同的区间范围值，Tween不保存任何状态，它只是起始值的变换函数。
  //   _animation = Tween<double>(begin:0 ,end: -300).animate(curvedAnimation);
  //   _controller.addListener(() {
  //     //监听插值变化
  //     setState(() {
  //      // print(_animation.value);
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _controller.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer'),),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isAnimating = !isAnimating;
                      });
                    },
                    child: AnimatedContainer(
                      height: isAnimating ? 300 : 100,
                      width: isAnimating ? 300 : 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/ant.png'),
                          fit: BoxFit.cover
                        ),
                      ),
                      duration: const Duration(seconds: 5),
                      curve: Curves.ease,
                      onEnd: (){
                        setState(() {

                        });
                      },
                    ),
                  )
                  // Transform.translate(
                  //   offset:  Offset(0,_animation.value),
                  //   child: Image.asset(
                  //     'images/qiu.png',
                  //     fit: BoxFit.contain,
                  //     height: 70,
                  //     width: 70,
                  //   ),
                  // ),
                  // GestureDetector(
                  //   //当用户在容器内部点击时，isAnimating变量的值将会改变
                  //   onTap: (){
                  //     setState(() {
                  //       isAnimating = !isAnimating;
                  //     });
                  //   },
                  //   child: AnimatedContainer(
                  //     duration: const Duration(seconds: 5),
                  //     height: isAnimating ? 200: 20,
                  //     width: isAnimating ? MediaQuery.of(context).size.width*0.8 :60,
                  //     curve: isAnimating ? Curves.bounceIn : Curves.bounceOut,
                  //     decoration: BoxDecoration(
                  //       color: isAnimating ?  Colors.green: Colors.blue,
                  //       borderRadius: isAnimating ? const BorderRadius.only(
                  //         topLeft: Radius.circular(30),
                  //         topRight: Radius.circular(30)
                  //       ) :const BorderRadius.all(Radius.circular(0)),
                  //       border: Border.all(
                  //         color: isAnimating ? Colors.orange :Colors.red,
                  //         width: isAnimating? 8 :2
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}
