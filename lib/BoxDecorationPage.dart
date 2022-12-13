import 'package:flutter/material.dart';
import 'dart:math' as math;
class BoxDecorationPage extends StatelessWidget {
  const BoxDecorationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BoxDecoration详解'),),
      body: SingleChildScrollView(
        physics: const PageScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30.0,),
              Container(
                  alignment: Alignment.bottomRight,
                  color: Colors.blue,
                  width: 150.0,
                  height: 100.0,
                  child: const Text("Hello Container")
              ),
              const SizedBox(height: 30.0,),
              Container(
                transform: Matrix4.rotationZ(0.2),
                width: 200,
                height: 100,
                color: Colors.green,
                child: const Text('Hello Container'),
              ),
              const SizedBox(height: 120.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:60.0,
                    width: 100.0,
                    color:Colors.green,
                    transform: Matrix4.rotationZ(0.5),
                    transformAlignment: Alignment.topLeft,
                    child:const Center(child:Text("topLeft")),
                  ),
                  Container(
                    height:60.0,
                    width: 100.0,
                    color:Colors.blue,
                    transform: Matrix4.rotationZ(0.5),
                    transformAlignment: Alignment.topCenter,
                    child:const Center(child:Text("topCenter")),
                  ),
                  Container(
                    height:60.0,
                    width: 100.0,
                    color:Colors.red,
                    transform: Matrix4.rotationZ(0.5),
                    transformAlignment: Alignment.topRight,
                    child:const Center(child:Text("topRight")),
                  ),
                ],
              ),

              const SizedBox(height: 100.0,),
              Container(
                foregroundDecoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.purple,
                      blurRadius: 5.0,
                      spreadRadius: 5.0
                    )
                  ]
                ),
                width: 200,
                height: 100,
              ),

              const SizedBox(height: 100.0,),
              Container(

                  constraints: const BoxConstraints.tightForFinite(width: 200.0,height:100.0),
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: const Text("Hello Container")
              ),

              Container(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    //下划线位置、线宽、颜色
                    bottom:BorderSide(width: 2.0,color: Colors.red),
                  )
                ),
                child:const Text('我是下划线！'),
              ),
              const SizedBox(height: 30.0,),
              Container(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                decoration:  BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Colors.red,
                    ),
                ),
                child:const Text('我是下划线！'),
              ),
              Container(
               width: double.infinity,
               height: 40,
               alignment: Alignment.center,
               decoration: const BoxDecoration(
                 border: Border(
                   bottom: BorderSide(width: 1.0,color: Colors.red),
                 )
               ),
                child: const Text('我是分割线'),
              ),
              Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  //背景颜色
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: const Text('圆角背景',style: TextStyle(color: Colors.white),),
              ),
              Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.blue,
                  )
                ),
                child: const Text('圆角线框',style: TextStyle(color: Colors.blue),),
              ),
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Text('圆形背景',style: TextStyle(color: Colors.white),),
              ),

              const SizedBox(height: 10.0,),
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue),
                ),
                child: const Text('圆形背景',style: TextStyle(color: Colors.blue),),
              ),

              Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6
                    )
                  ]
                ),
                child: const Text('阴影',style: TextStyle(color: Colors.blue),),
              ),
              const SizedBox(height: 10.0,),
              Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  //线性变性
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue,Colors.purple],
                  )
                ),
                child: const Text('线性渐变',style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 20.0,),
              Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration:  const BoxDecoration(
                    shape: BoxShape.circle,
                    //弧形变性
                    gradient: SweepGradient(
                        colors: [
                          Colors.red,
                          Colors.blue,
                          Colors.yellow,
                          Colors.green,
                          Colors.red,
                        ],
                        center: FractionalOffset.center,
                        startAngle: 0.0,
                        endAngle: math.pi * 2,
                        stops: [0,0.25,0.5,0.75,1],

                    )
                ),
                child: const Text('弧形渐变',style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height: 20.0,),
              Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    radius: 0.6,
                    colors: [Colors.red,Colors.blue],
                    stops: [0.2,0.9]
                  )
                ),
                child: const Text('扩散渐变',style: TextStyle(color: Colors.white),),
              ),

             const SizedBox(height: 20.0,),
              Container(
                width: double.infinity,
                height: 250,
                decoration:  BoxDecoration(
                  //设置背景图
                  image: DecorationImage(
                    image: const AssetImage('images/liu.webp'),
                    fit: BoxFit.cover,//图片填充方式
                    alignment: Alignment.center,//图片位置
                    repeat: ImageRepeat.noRepeat,//图片是否重复
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  )
                ),
                child: const Center(child: Text('DecorationImage-AssetImage')),
              ),
              const SizedBox(height: 20.0,),
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(

                    //设置背景图
                    image: DecorationImage(
                      image: ExactAssetImage('images/liu.webp'),
                      fit: BoxFit.cover,//图片填充方式
                      alignment: Alignment.center,//图片位置
                      repeat: ImageRepeat.noRepeat,//图片是否重复
                    )
                ),
                child: const Center(child: Text('DecorationImage-ExactAssetImage')),
              ),
              const SizedBox(height: 20.0,),
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(

                    //设置背景图
                    image: DecorationImage(
                      image: NetworkImage('https://cdn.tehub.com/uploads/9x1MQZaDYV/b/a2Y7VFyUxy/5b87afe9-66aa-4b41-85e0-d8ad514b9080.webp'),
                      fit: BoxFit.cover,//图片填充方式
                      alignment: Alignment.center,//图片位置
                      repeat: ImageRepeat.noRepeat,//图片是否重复
                    )
                ),
                child: const Center(child: Text('DecorationImage-NetworkImage')),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
