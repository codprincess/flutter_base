import 'package:flutter/material.dart';

class SliverAnimatedOpacityPage extends StatefulWidget {
  const SliverAnimatedOpacityPage({Key? key}) : super(key: key);

  @override
  State<SliverAnimatedOpacityPage> createState() => _SliverAnimatedOpacityPageState();
}

class _SliverAnimatedOpacityPageState extends State<SliverAnimatedOpacityPage> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliverAnimatedOpacity'),),
      body: CustomScrollView(
        slivers: [
          SliverAnimatedOpacity(
            opacity: _isVisible ? 1.0: 0.0,
            duration: const Duration(milliseconds: 1000),
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
          ),
        ],
      ),
    );
  }
}
