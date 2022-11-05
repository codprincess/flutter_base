import 'package:flutter/material.dart';
class BottomAppBarPage extends StatefulWidget {
  const BottomAppBarPage({Key? key}) : super(key: key);
  @override
  State<BottomAppBarPage> createState() => _BottomAppBarPageState();
}
class _BottomAppBarPageState extends State<BottomAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomAppBar'),),
      body: const Center(
        child: Text('BottomAppBar Page'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add a book'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar:  BottomAppBar(
        shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(side: BorderSide())
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () {},),
            IconButton(icon: const Icon(Icons.person), onPressed: () {},),
          ],
        ),
      ),
    );
  }
}
