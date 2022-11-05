import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  const CustomScrollViewPage({Key? key}) : super(key: key);

  @override
  State<CustomScrollViewPage> createState() => _CustomScrollViewPageState();
}

class _CustomScrollViewPageState extends State<CustomScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context,int index){
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100*(index%9)],
                      child: Text('$index'),
                    );
                  }
              ),
              itemExtent: 50
          )
          // SliverList(
          //    delegate: SliverChildBuilderDelegate(
          //        (BuildContext context,int index){
          //          return Card(
          //            margin: const EdgeInsets.all(15),
          //            child: Container(
          //              color: Colors.purple[100 * (index%9+1)],
          //              height: 80,
          //              alignment: Alignment.center,
          //              child: Text(
          //                'Iitem $index',
          //                style: const TextStyle(fontSize: 30),
          //              ),
          //            ),
          //          );
          //        },
          //      childCount: 1000,
          //    )
          // )

        ],

      ),
    );
  }
}






