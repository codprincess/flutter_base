import 'dart:math';

import 'package:flutter/material.dart';

class SliverPersistentHeaderPage extends StatefulWidget {
  const SliverPersistentHeaderPage({Key? key}) : super(key: key);

  @override
  State<SliverPersistentHeaderPage> createState() => _SliverPersistentHeaderPageState();
}

class _SliverPersistentHeaderPageState extends State<SliverPersistentHeaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverHeader(maxExtent: 300,minExtent: 100)
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context,int index){
                return Card(
                  margin: const EdgeInsets.all(15),
                  child: Container(
                    color: Colors.purple[100 * (index%9+1)],
                    height: 80,
                    alignment: Alignment.center,
                    child: Text(
                      'Iitem $index',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                );
              },
              childCount: 1000,
            )
          )
        ],
      ),
    );
  }
}

class MySliverHeader extends SliverPersistentHeaderDelegate {
  MySliverHeader({
    required this.minExtent,
    required this.maxExtent,
  });
  final double minExtent;//SliverPersistentHeader最小高度
  final double maxExtent;//SliverPersistentHeader最大高度
  @override
  Widget build(BuildContext context,double shrinkOffset,bool overlapsContent){
      print(shrinkOffset);
      return Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("images/liu.webp",fit: BoxFit.cover,),
          Positioned(
            left: 15,
            top: 25,
            right: 15,
            bottom: 15,
            //标题透明度
            child:Opacity(
              opacity: 1.0 - max(0.0, shrinkOffset) / maxExtent,
              child: Text("顶部标题",style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Colors.black,
              ),),
            )
          )
        ],
      );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
   // throw UnimplementedError();
    return true;
  }}

