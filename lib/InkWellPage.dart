
import 'package:flutter/material.dart';

class InkWellPage extends StatefulWidget {
  const InkWellPage({Key? key}) : super(key: key);

  @override
  State<InkWellPage> createState() => _InkWellPageState();
}

class _InkWellPageState extends State<InkWellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InkWell'),),
      body: Column(
        children: [
          InkWell(
            onTap: (){},//一定要有点击事件，否则没有水波纹
            splashColor: const Color.fromRGBO(255, 2555, 255, 0.5),//水波纹的颜色
            highlightColor: Colors.orange,//高亮颜色
            child: Container(
              width: 200,
              height: 60,
              alignment: Alignment.center,
              // decoration:  BoxDecoration(
              //   border: Border.all(color: Colors.red,width: 1),
              //   borderRadius: const BorderRadius.all(Radius.circular(30.0))
              // ),
              child: const Text('InkWell点击水波纹'),
              
            ),
          ),
          const SizedBox(height: 50,),
          Material(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),//并不能修饰InkWell的水波纹
            color: Colors.amber,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              hoverColor: Colors.orange,
              splashColor: Colors.red,
              focusColor: Colors.yellow,
              child: Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                child: const Text('Material包裹InkWell'),
              ),
              onTap: (){},
            ),
          ),

          const SizedBox(height: 50,),

          Ink(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.amber,
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              hoverColor: Colors.orange,
              splashColor: Colors.red,
              focusColor: Colors.yellow,
              onTap: (){},
              child: Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,

                child: const Text('Ink包裹InkWell'),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
