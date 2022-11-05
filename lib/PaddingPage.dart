import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  const PaddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('容器类组件'),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            //显式指定对齐方式为左对齐，排除对齐干扰
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Padding(
              //     padding: EdgeInsets.only(left: 10),
              //     child: Text('左边添加10像素'),
              // ),
              // const  Padding(
              //   padding: EdgeInsets.symmetric(vertical: 20),
              //   child: Text('上下添加20像素'),
              // ),
              // const  Padding(
              //   padding: EdgeInsets.fromLTRB(20,40,20,20),
              //   child: Text('指定四个方向的补白'),
              // ),
              //   DecoratedBox(
              //      decoration: BoxDecoration(
              //         color: Colors.red,//背景颜色
              //         // image: const DecorationImage(//背景图片
              //         //    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              //         //    fit: BoxFit.cover,
              //         // ),
              //          border:Border.all( //设置边框
              //            width: 2,
              //            color: Colors.green,
              //          ),
              //         borderRadius:BorderRadius.circular(5.0),//设置圆角
              //          boxShadow:const [//设置阴影
              //            BoxShadow(
              //              color: Colors.black54,
              //              offset: Offset(2.0,2.0),
              //              blurRadius: 4.0
              //            ),
              //          ],
              //          //背景渐变
              //          gradient:LinearGradient(colors:[Colors.red,Colors.orange.shade700]),
              //          backgroundBlendMode: BlendMode.colorDodge,
              //          //shape:BoxShape.circle,//形状
              //      ),
              //    child:const Padding(
              //      padding: EdgeInsets.symmetric(horizontal: 90,vertical: 20),
              //      child: Text('装饰元素'),
              //    ),
              //  ),
              // Container(
              //   alignment: Alignment.center,//文字居中
              //   margin: const EdgeInsets.only(top: 50.0,left: 110.0,bottom: 50.0),//外边距
              //   // color: Colors.red,//背景色
              //   width: 200.0,
              //   height: 200.0,
              //   decoration: const BoxDecoration(
              //     gradient: RadialGradient(//背景径向渐变
              //       colors: [Colors.red,Colors.orange],
              //       center: Alignment.topLeft,
              //       radius: .98,
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black45,
              //         offset: Offset(2.0,2.0),
              //         blurRadius: 4.0
              //       )
              //     ]
              //   ),
              //   transform: Matrix4.rotationZ(.2),
              //   transformAlignment: Alignment.topCenter,//变换锚点或者是变换重力方向和alignment是一样的
              //   child: const Text('Container',style: TextStyle(color: Colors.white,fontSize: 30.0),),
              // ),
              // ClipOval(
              //   child: Image.asset('images/avatar.jpg',width: 100.0,height: 100.0,),
              // ),
              // ClipOval(
              //   child: Image.asset('images/avatar.jpg',width: 100.0,height: 50.0,),
              // ),
              //剪裁为圆角矩形
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(5.0),
              //   child: Image.asset('images/avatar.jpg',width: 100.0,height: 100.0,),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Align(
              //       alignment: Alignment.topLeft,
              //       widthFactor: .5,//宽度为原来的一半,实际宽度等于80×0.5
              //       child: Image.asset('images/avatar.jpg',width: 80.0,height: 80.0,),
              //     ),
              //     const Text('溢出部分剪裁'),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ClipRect(
              //       child: Align(
              //         alignment: Alignment.topLeft,
              //         widthFactor: .5,//宽度为原来的一半,实际宽度等于80×0.5
              //         child: Image.asset('images/avatar.jpg',width: 80.0,height: 80.0,),
              //       ),
              //     ),
              //     const Text('溢出部分剪裁'),
              //   ],
              // ),

              FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(children: [Text('xx'*30)]), //文本长度超出 Row 的最大宽度会溢出
                ),
              ),
              FittedBox(
                fit: BoxFit.fitHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(children: [Text('xx'*30)]), //文本长度超出 Row 的最大宽度会溢出
                ),
              ),







            ],
          ),

        ),
      ),
    );
  }
}
