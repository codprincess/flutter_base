import 'package:flutter/material.dart';

class  SliverPrototypeExtentListPage extends StatelessWidget {
  const  SliverPrototypeExtentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
            SliverPrototypeExtentList(
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.green,
                ),
              ]),
              prototypeItem: const SizedBox(
                height: 200,//所有容器将获得原型中定义的150px高度
              )
            )
        ],
      ),
    );
  }
}
