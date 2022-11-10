import 'package:flutter/material.dart';

class NestedScrollViewPage extends StatelessWidget {
  const NestedScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ExampleOne(),
    );
  }
}

class ExampleOne extends StatelessWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
        return <Widget>[
           SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            forceElevated: innerBoxIsScrolled,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('NestedScrollView'),
              background: Image.asset('images/liu.webp',fit: BoxFit.cover,),
            ),
          )
        ];
      },
      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context , int index){
          return Container(
            height: 100,
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(
              child: Text('Item $index',style: const TextStyle(color: Colors.white,fontSize: 30),),
            ),
          );
        },
        itemCount: 30,
      )
    );
  }
}



class ExampleTwo extends StatelessWidget {
  const ExampleTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Tab 1','Tab 2'];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
            return <Widget> [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: Colors.red,
                  pinned: true,
                  expandedHeight: 150.0,
                  forceElevated: innerBoxIsScrolled,

                  bottom: TabBar(
                    tabs: tabs.map((String name) => Tab(text:name)).toList(),
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            children: tabs.map((String name)  {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context){
                    return CustomScrollView(
                      slivers: [
                        SliverOverlapInjector(
                           handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.all(10),
                          sliver: SliverFixedExtentList(
                            itemExtent: 50,
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context,int index){
                                  return ListTile(
                                    title: Text('Item $index'),
                                  );
                                },
                              childCount: 50,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      )
    );
  }
}








