import 'package:flutter/material.dart';
class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppPage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabBarPage(),
    );
  }
}

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TabBar导航栏'),
            bottom: TabBar(
              tabs: [
                Row (children: const [Icon(Icons.directions_car), SizedBox(width:5), Text("Car")]),
                Row (children: const [Icon(Icons.directions_transit), SizedBox(width:5), Text("Transit")]),
                Row (children: const [Icon(Icons.directions_bike), SizedBox(width:5), Text("Bike")])
              ],
              onTap: (index){
                setState(() {
                  print(index);
                });
              },
            ),
          ),

        ),
    );
  }
}


// class TabBarPage extends StatelessWidget {
//   // const TabBarPage({Key? key}) : super(key: key);
//   int carClick = 0;
//   int transitClick = 0;
//   int bikeClick = 0;
//   void onTapHandle(int index){
//     setState((){
//
//     })
//   }
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               tabs: [
//                 Row (children: const [Icon(Icons.directions_car), SizedBox(width:5), Text("Car")]),
//                 Row (children: const [Icon(Icons.directions_transit), SizedBox(width:5), Text("Transit")]),
//                 Row (children: const [Icon(Icons.directions_bike), SizedBox(width:5), Text("Bike")])
//               ],
//               onTap: (index){
//
//               },
//               // indicatorColor: const Color(0xffE74C3C),
//               // indicatorWeight: 5,
//               // indicatorPadding: const EdgeInsets.only(right: 20.0),
//
//               // indicator: const ShapeDecoration(
//               //   shape: UnderlineInputBorder(
//               //     borderSide: BorderSide(
//               //       color: Colors.transparent,
//               //       width: 0,
//               //       style: BorderStyle.solid
//               //     ),
//               //   ),
//               //   gradient: LinearGradient(colors: [Color(0xff01ff80),Color(0xff0081ff)]),
//               //
//               // ),
//
//               // labelColor: Colors.red,
//               // unselectedLabelColor: Colors.white,
//               // labelPadding: const EdgeInsets.all(20.0),
//               labelStyle: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//               unselectedLabelStyle: const TextStyle(
//                 fontSize: 16,
//               ),
//
//
//
//
//             ),
//
//             //背景色
//             title: const Text('导航栏'),
//             automaticallyImplyLeading: true,
//           ),
//           body: const TabBarView(
//             children: [
//               Center(child: Text("Car")),
//               Center(child: Text("Transit")),
//               Center(child: Text("Bike")),
//               // Center(child: Text("Boat")),
//               // Center(child: Text("Railway")),
//               // Center(child: Text("Bus"))
//             ],
//           )
//
//       ),
//     );
//
//   }
// }


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: ClipOval(
                          child: Image.asset('images/avatar.jpg',width: 60,height: 60,),
                        ),
                    ),
                    const Text(
                      'hedy',
                      style: TextStyle(fontSize: 30.0),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                      children: const [
                        ListTile(
                          leading: Icon(Icons.add),
                          title: Text('Add account'),
                        ),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Manage account'),
                        ),
                      ],
                  ),
              )
            ],

          )
      ),
    );
  }
}
