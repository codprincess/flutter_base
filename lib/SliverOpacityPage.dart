import 'package:flutter/material.dart';

class SliverOpacityPage extends StatefulWidget {
  const SliverOpacityPage({Key? key}) : super(key: key);

  @override
  State<SliverOpacityPage> createState() => _SliverOpacityPageState();
}

class _SliverOpacityPageState extends State<SliverOpacityPage> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliverOpacity'),),
      body: CustomScrollView(
        slivers: [
          SliverOpacity(
            opacity: _isVisible ? 1 : 0,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context,index){
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.primaries[index % Colors.primaries.length],
                      height: 100,
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: const Icon(Icons.flip),
                        tooltip: '点击隐藏',
                      ),
                    );
                  },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

