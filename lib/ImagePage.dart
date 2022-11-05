import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('图片加载'),),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children:  [
             const Image(
              image:  AssetImage('images/avatar.jpg'),
              width: 100,
              height: 100,
              semanticLabel: '头像图片',//图片描述
              color: Colors.red,//图片前景颜色,会覆盖图片，一般会和colorBlendMode结合使用
              colorBlendMode: BlendMode.colorDodge,//一般和color结合使用，设置color的混合模式
              fit: BoxFit.fill,//设置图片的显示模式
              alignment: Alignment.center,//设置图片的对齐方式
              repeat: ImageRepeat.noRepeat,//图片的重复方式
            ),

            Image.asset('images/avatar.jpg',
              width: 150,
              height: 150,
              semanticLabel: '头像图片',//图片描述
              color: Colors.pink,//图片前景颜色,会覆盖图片，一般会和colorBlendMode结合使用
              colorBlendMode: BlendMode.difference,//一般和color结合使用，设置color的混合模式
              fit: BoxFit.fill,//设置图片的显示模式
              alignment: Alignment.center,//设置图片的对齐方式
              repeat: ImageRepeat.noRepeat,//图片的重复方式
            ),
            Image.network(
              'https://code52-1305763557.file.myqcloud.com/uploads/9x1MQZaDYV/u/avatar/de74a650-45fa-4495-86fb-967fc91766de.jpg?imageView2/1/w/40/h/40/q/100',
              width: 150,
              height: 150,
              scale: 1,//缩放
              //同上属性
            ),
            //
            // //Image也提供了一个快捷的构造函数Image.network用于从网络加载、显示图片
            // Image.network(
            //   'https://code52-1305763557.file.myqcloud.com/uploads/9x1MQZaDYV/u/avatar/de74a650-45fa-4495-86fb-967fc91766de.jpg?imageView2/1/w/40/h/40/q/100',
            //   width: 250,
            //   height: 250,
            //    //同上属性
            // ),

          const Icon(
              Icons.ac_unit,
              color: Colors.green,//图标颜色
              size: 40,//图标大小
              semanticLabel: '图标描述',//图标描述
              textDirection: TextDirection.rtl,//Icon组件里也可以添加文本内容,有些文本书写的方向是从左到右 Text-Direction.ltr / 反rtl
              shadows: [ //阴影
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(125, 0, 0, 255),
                ),
              ],
            ),

            const Icon(MyIcons.book,color: Colors.purple),


          ],
        ),
      ),
    );
  }
}

//自定义图标
class MyIcons{
  static const IconData book = IconData(
      0xe614,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );

  static const IconData wechat =  IconData(
      0xec7d,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );

}