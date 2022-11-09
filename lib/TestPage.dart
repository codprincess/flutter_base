import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WithSliverSafeArea()
    );
  }

  Widget WithSliverSafeArea(){
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver: SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context,int index){
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text('Item $index'),
                  );
                },
                childCount: 20
              ),
            ),
          )
        )
      ],
    );
  }
}

