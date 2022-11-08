import 'package:flutter/material.dart';

class SliverVisibilityPage extends StatefulWidget {
  const SliverVisibilityPage({Key? key}) : super(key: key);

  @override
  State<SliverVisibilityPage> createState() => _SliverVisibilityPageState();
}

class _SliverVisibilityPageState extends State<SliverVisibilityPage> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliverVisibility'),),
      body: CustomScrollView(
        slivers: [
          SliverVisibility(
            visible: _isVisible,
            replacementSliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.blue,
                child: const Center(
                  child: Text('图片隐藏时显示',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
            sliver: SliverToBoxAdapter(
              child:Container(
                width: double.infinity,
                height: 300,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    image:DecorationImage(
                      image:AssetImage('images/liu.webp'),
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    )
                ),
                child: IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.ads_click),
                  onPressed: (){
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
