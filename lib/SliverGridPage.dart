import 'dart:math';

import 'package:flutter/material.dart';

class SliverGridPage extends StatefulWidget {
  const SliverGridPage({Key? key}) : super(key: key);

  @override
  State<SliverGridPage> createState() => _SliverGridPageState();
}

class _SliverGridPageState extends State<SliverGridPage> {
  final List _gridItem = List.generate(100, (index) => "Item $index");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliverGrid'),),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.green,
            expandedHeight: 200,
            elevation: 1,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.deepOrange,
                child: const Center(
                  child: Icon(
                    Icons.favorite,
                    size: 70,
                    color: Colors.yellow,
                  ),
                ),
              ),
              title: const Text('第一个SliverAppBar',style: TextStyle(color: Colors.white),),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
            children:  [
              Card(
                color: Colors.blue[200],
                child: Container(),
              ),
              Card(
                color: Colors.blue[400],
                child: Container(),
              ),
              Card(
                color: Colors.blue[600],
                child: Container(),
              ),
              Card(
                color: Colors.blue[100],
                child: Container(),
              ),
            ],
          ),
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),
          SliverAppBar(
            elevation: 5,
            pinned: true,
            backgroundColor: Colors.purple,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.amber,
                child: const Center(
                  child: Icon(
                    Icons.favorite,
                    size: 70,
                    color: Colors.yellow,
                  ),
                ),
              ),
              title: const Text('第二个SliverAppBar',style: TextStyle(color: Colors.white),),
            ),
          ),

          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context,int index){
                  return Card(
                    color: Colors.amber[Random().nextInt(9)*100],
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(_gridItem[index]),
                    ),
                  );
                },
                childCount:_gridItem.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2,
            )
          )
        ],
      ),
    );
  }
}
