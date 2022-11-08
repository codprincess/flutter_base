import 'package:flutter/material.dart';

class SliverFillViewportPage extends StatelessWidget {
  const SliverFillViewportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillViewport(
            delegate: SliverChildBuilderDelegate((context,index){
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
              );
            },childCount: 5),
            viewportFraction: 1.0,
          )
        ],
      ),
    );
  }
}
