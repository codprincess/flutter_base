import 'package:flutter/material.dart';

class SliverToBoxAdapterPage extends StatelessWidget {
  const SliverToBoxAdapterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.green,
              height: 100,
              child: const Center(
                child: Text('顶部标题',style: TextStyle(
                  shadows: [Shadow(color: Colors.yellow,offset: Offset(1,1))]
                ),),
              ),
            ),
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
                      'Item $index',
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
