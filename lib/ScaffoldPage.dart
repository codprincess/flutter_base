
import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/TextPage.dart';

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({Key? key}) : super(key: key);

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold用法',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),

    );
  }
}

class Exp1 extends StatelessWidget {
  const Exp1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基本用法1'),
        leading: Builder(builder: (context){
          return IconButton(
            onPressed: (){
             // Scaffold.of(context).showBottomSheet((context) => _bottomSheet(context));
            },
            icon: const Icon(Icons.notification_add,color: Colors.white,),
          );
        }),
      ),
      body: const Text('内容页'),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
     // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      //floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      //固定在下方显示的按钮
      // persistentFooterButtons: [
      //   IconButton(onPressed: (){}, icon: const Icon(Icons.map)),
      //   IconButton(onPressed: (){}, icon: const Icon(Icons.view_week))
      // ],
      // persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label:'Book'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:'Me'
          ),
        ],
        // onTap: (int index){
        //     setState((){
        //       in
        //     })
        // },
      ),
      //bottomSheet: _bottomSheet(context),
    );
  }
}

class Exp2 extends StatefulWidget {
  const Exp2({Key? key}) : super(key: key);

  @override
  State<Exp2> createState() => _Exp2State();
}

class _Exp2State extends State<Exp2> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: const Text('bottomNavigationBar'),),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
     // body: MainBody(),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedIndex,//选中项
      //   // fixedColor: Colors.green,//选中颜色图标个标签
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.white,//背景颜色
      //   iconSize: 20,//图标大小
      //   // selectedItemColor: Colors.red,
      //   // unselectedItemColor: Colors.green,
      //   selectedIconTheme: const IconThemeData(
      //     color: Colors.red,
      //     opacity: .8,
      //     size: 30,
      //   ),
      //   unselectedIconTheme: const IconThemeData(
      //     color: Colors.green,
      //     opacity: .8,
      //     size: 30,
      //   ),
      //   // selectedFontSize: 36,
      //   // unselectedFontSize: 12,
      //   // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 36),
      //   // unselectedLabelStyle: const TextStyle(fontSize: 14),
      //   showSelectedLabels: false,//隐藏标签
      //   showUnselectedLabels: true,//显示标签
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label:'Home'
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.book),
      //         label:'Book'
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label:'Me'
      //     ),
      //   ],
      //   onTap: (int index){
      //     setState(() {
      //       selectedIndex = index;
      //     });
      //   },
      // ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(2);
              }),
          TabData(
              iconData: Icons.search,
              title: "Search",
              onclick: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TextPage()))),
          TabData(iconData: Icons.shopping_cart, title: "Basket")
        ],
        initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[Text("Hello"), Text("World")],
        ),
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the home page"),
            ElevatedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              //color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TextPage()));
              },
            ),
            ElevatedButton(
              child: Text(
                "Change to page 3",
                style: TextStyle(color: Colors.white),
              ),
              //color: Theme.of(context).accentColor,
              onPressed: () {

              },
            )
          ],
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the search page"),
            ElevatedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
             // color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TextPage()));
              },
            )
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the basket page"),
            ElevatedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              // color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }

  // Widget? MainBody(){
  //   if(selectedIndex== 0){
  //     return MyHome();
  //   }else if(selectedIndex==1){
  //     return MyBook();
  //   }else{
  //     return Mine();
  //   }
  // }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('home'),);
  }
}
class MyBook extends StatelessWidget {
  const MyBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('book'),);
  }
}
class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('mine'),);
  }
}








// BottomSheet _bottomSheet(context){
//   return BottomSheet(
//     onClosing: (){
//       print("closed");
//     },
//     builder: (context){
//       return Container(
//         height: 300,
//         color: Colors.yellow,
//         alignment: Alignment.centerLeft,
//         child: const Text("BottomSheet In Scaffold"),
//       );
//     },
//   );
// }


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fancy Bottom Navigation"),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(2);
              }),
          TabData(
              iconData: Icons.search,
              title: "Search",
              onclick: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TextPage()))),
          TabData(iconData: Icons.shopping_cart, title: "Basket")
        ],
        initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[Text("Hello"), Text("World")],
        ),
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("This is the home page"),
            ElevatedButton(
              child: const Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TextPage()));
              },
            ),
            ElevatedButton(
              child: const Text(
                "Change to page 3",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(2);
              },
            )
          ],
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("This is the search page"),
            ElevatedButton(
              child: const Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TextPage()));
              },
            )
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("This is the basket page"),
            ElevatedButton(
              child: const Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            )
          ],
        );
    }
  }
}


