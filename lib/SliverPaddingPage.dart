import 'package:flutter/material.dart';

class SliverPaddingPage extends StatelessWidget {
  const SliverPaddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliverPadding'),),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context,index){
                  return Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Text('List item : $index'),
                  );
                },
                childCount: 10
              ),
            ),
          )
        ],
      ),
    );
  }
}
