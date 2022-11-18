import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  var _themeColor = Colors.green;//当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,//用于导航栏、FloatingActionButton的背景色等
        iconTheme: IconThemeData(color: _themeColor)//用于Icon
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('路由换肤功能'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: const [
                 Icon(Icons.favorite),
                 Icon(Icons.airport_shuttle),
                 Text('颜色跟随主题')
               ],
            ),
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                  color: Colors.black //为第二行Icon自定义颜色（固定为黑色)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text('颜色固定颜色')
                ],
              )
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _themeColor = _themeColor == Colors.green ? Colors.blue : Colors.green;
            });
          },
          child: const Icon(Icons.palette),
        ),
      )
    );
  }
}
