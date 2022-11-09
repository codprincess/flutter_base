import 'package:flutter/material.dart';

class SliverSafeAreaPage extends StatelessWidget {
  const SliverSafeAreaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WithoutSliverSafeArea(),
    );
  }

  Widget WithoutSliverSafeArea (){
    return const CustomScrollView(
      slivers: [
        SliverAppBar(title: Text('SliverSafeArea'),)
      ],
    );
  }
  Widget WithSliverSafeArea (){
    return const CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver:  SliverAppBar(title: Text('SliverSafeArea'),)
       )
      ],
    );
  }



}

