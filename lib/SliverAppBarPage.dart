import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  State<SliverAppBarPage> createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: CustomScrollView(
          slivers: [
             SliverAppBar(
              leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
              actions: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz))
              ],
              flexibleSpace:  FlexibleSpaceBar(
                background: Image.asset("images/logo.png",fit: BoxFit.fill,),
                title: const Text('移动标题'),
                centerTitle: true,
                collapseMode: CollapseMode.pin,
              ),
              title: const Text('标题'),//标题
              expandedHeight: 200,//展开高度
              floating: false,//滑动时是否悬浮
              pinned: true,//标题栏固定
              snap: false,
              backgroundColor: Colors.green,
            ),
            SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                    (context,int index) => Card(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.primaries[(index % 15)],
                        child: Text("Item $index",style: const TextStyle(fontSize: 30,color: Colors.white),),
                      ),
                    )),
                itemExtent: 80
            )
          ],
        ),
    );
  }
}
