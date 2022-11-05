import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('文本及样式')),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children:  [
            //文本的对齐方式
            Text("文本的对齐方式"*6,textAlign: TextAlign.right,),//right\start\end\justify\center

            //文本溢出显示
            Text('文本溢出显示'*9,maxLines: 1,overflow: TextOverflow.ellipsis,),//
            //字体大小的缩放
            Text('字体大小的缩放',textScaleFactor: 1.5,),
            //字体的样式TextStyle
            Text('字体的样式TextStyle',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18.0,//大小
                fontWeight: FontWeight.bold,//加粗
                letterSpacing: 5,//字间隔
                wordSpacing: 10,//词间隔
                height: 1.2,//行高
                fontFamily: 'Courier',//字体，在pubspec.yaml中声明
                //backgroundColor: Colors.black12,//背景颜色
                background: Paint()..color = Colors.black12,//背景颜色
                decoration: TextDecoration.underline,//文字线,删除线
                decorationStyle: TextDecorationStyle.solid,//文字线虚线实线
                decorationColor: Colors.amber,//文字线颜色
                decorationThickness:1,//文字线高度
                shadows: const <Shadow> [//阴影
                  Shadow(offset: Offset(10.0,10.0),blurRadius: 3.0,color: Color.fromARGB(255, 0, 0, 0)),
                  Shadow(offset: Offset(10.0,10.0),blurRadius: 8.0,color: Color.fromARGB(125, 0, 0, 255)),
                ],
              ),
            ),

            //文本片段TextSpan
            const Text.rich(TextSpan(
              children: [
                TextSpan(text: 'Home:'),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                    color: Colors.blue
                  ),

                )
              ]
            )),

            //ElevatedButton
            ElevatedButton(
              onPressed: (){},//点击
              onLongPress: (){},//长按
              onFocusChange: (bool b){print(b);},//焦点变化
              onHover: (bool c){print(c);},//鼠标悬停
              autofocus: false,//是否自动获取焦点
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,//背景色
                foregroundColor: Colors.red,//按钮字体颜色和波纹颜色
                shadowColor: Colors.greenAccent,//阴影颜色
                surfaceTintColor: Colors.black,
                padding: EdgeInsets.all(20.0),//按钮内边距
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25) //圆角弧度
                ),
                minimumSize: const Size(64, 40),//按钮最小

              ),
              child: const Text('漂浮按钮'),
            ),

            TextButton(
                onPressed: (){},//点击
                onLongPress: (){},//长按
                onFocusChange: (bool b){print(b);},//焦点变化
                onHover: (bool c){print(c);},//鼠标悬停
                autofocus: false,//是否自动获取焦点
                style:TextButton.styleFrom(
                  //同上
                ) ,
                child: const Text('文本按钮')
            ),

            OutlinedButton(
                onPressed: (){},//点击
                onLongPress: (){},//长按
                onFocusChange: (bool b){print(b);},//焦点变化
                onHover: (bool c){print(c);},//鼠标悬停
                autofocus: false,//是否自动获取焦点
                style: OutlinedButton.styleFrom(
                  //同上
                ),
                child: const Text('边框按钮')
            ),

            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.ac_unit),//图标
                iconSize: 30,//图标大小
                color: Colors.red,//图标红色
                disabledColor: Colors.black,//icon 不可点击颜色，onPressed == null 时生效
                splashColor: Colors.yellow,//点击时闪过的颜色
                highlightColor: Colors.green,//按下去高亮的颜色
                padding: const EdgeInsets.all(10),//padding 不设置时，默认为 8.0

            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("发送"),
              onPressed: (){},
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: (){},
            ),
            TextButton.icon(
              icon: const Icon(Icons.info),
              label: const Text("详情"),
              onPressed: (){},
            ),
            //加载图片









          ],
        ),
      ),
    );
  }
}
