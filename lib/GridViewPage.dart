import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);
  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final myProducts = List<Map>.generate(1000, (index) => {"id":index,"name":"P $index"}).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView网格组件'),),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
        itemCount: myProducts.length,
        itemBuilder: (BuildContext context,index){
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(myProducts[index]["name"]),
          );
        }
      ),
    );
  }
}

// body: GridView(
//   // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//   //   crossAxisCount: 3,//横轴3个
//   //   childAspectRatio: 1.0,//宽高比1
//   // ),
//   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//     maxCrossAxisExtent: 120,
//     childAspectRatio: 2,//宽高比2
//   ),
//   children: const [
//     Icon(Icons.ac_unit),
//     Icon(Icons.apple),
//     Icon(Icons.android),
//     Icon(Icons.access_time_filled),
//     Icon(Icons.share_location),
//     Icon(Icons.star_half),
//   ],
// ),
// body: GridView.count(
//   crossAxisCount: 3,
//   childAspectRatio: 1,
//   children: const [
//     Icon(Icons.ac_unit),
//     Icon(Icons.apple),
//     Icon(Icons.android),
//     Icon(Icons.access_time_filled),
//     Icon(Icons.share_location),
//     Icon(Icons.star_half),
//   ],
// ),
// body: GridView.extent(
//   maxCrossAxisExtent: 120,
//   childAspectRatio: 2,
//   children: const [
//     Icon(Icons.ac_unit),
//     Icon(Icons.apple),
//     Icon(Icons.android),
//     Icon(Icons.access_time_filled),
//     Icon(Icons.share_location),
//     Icon(Icons.star_half),
//   ],
// ),
