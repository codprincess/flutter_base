import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FlowViewPage extends StatefulWidget {
  const FlowViewPage({Key? key}) : super(key: key);

  @override
  State<FlowViewPage> createState() => _FlowViewPageState();
}

class _FlowViewPageState extends State<FlowViewPage> {
  final List<Map<String,dynamic>> _items = List.generate(200, (index) => {
    "id":index,
    "title":"Item $index",
    "height":Random().nextInt(100)+30.5
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('瀑布流'),),
      body: MasonryGridView.count(
        itemCount: _items.length,
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        itemBuilder: (context,index){
          return Card(
            color: Colors.primaries[index % Colors.primaries.length],
            key: ValueKey(_items[index]['id']),
            child: SizedBox(
              height: _items[index]['height'],
              child: Center(
                child: Text(_items[index]['title']),
              ),
            ),
          );
        }
      ),
    );
  }
}
