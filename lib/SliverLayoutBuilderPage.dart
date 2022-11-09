import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverLayoutBuilderPage extends StatefulWidget {
  const SliverLayoutBuilderPage({Key? key}) : super(key: key);

  @override
  State<SliverLayoutBuilderPage> createState() => _SliverLayoutBuilderPageState();
}

class _SliverLayoutBuilderPageState extends State<SliverLayoutBuilderPage> {
  var _color = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliverLayoutBuilder'),),
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (BuildContext context,SliverConstraints constraints){
              if(constraints.userScrollDirection == ScrollDirection.forward){
                _color = Colors.blue;//向下滑动显示蓝色
              }else if(constraints.userScrollDirection == ScrollDirection.idle){
                _color = Colors.yellow;//正常显示黄色
              }else{
                _color = Colors.purple;//向上滑动显示紫色
              }
              return SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: _color,
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
