import 'package:flutter/material.dart';
import 'package:flutter_base/pages/PageA.dart';
import 'package:flutter_base/pages/PageB.dart';
class ChangeNotifierProxyProviderPage extends StatefulWidget {
  const ChangeNotifierProxyProviderPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierProxyProviderPage> createState() => _ChangeNotifierProxyProviderPageState();
}
class _ChangeNotifierProxyProviderPageState extends State<ChangeNotifierProxyProviderPage> {
 var _selectedIndex = 0;
 var _pages = [PageA(),PageB()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChangeNotifierProxyProvider'),),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '书籍列表'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '收藏'
          ),
        ],
      ),
    );
  }
}
