import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  State<HeroPage> createState() => _HeroPageState();
}
class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero动画'),),
      body: const Ep1(),
    );
  }
}

class Ep1 extends StatelessWidget {
  const Ep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          InkWell(
            child: Hero(
              tag: 'pic',
              child: Image.asset('images/liu.webp',width: double.infinity,height: 300,),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DetailPage()
              ));
            },
          )
        ],
      ),

    );
  }
}
class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('DetailPage'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)
          ),
        ],
      ),
      body: Center(
        child: Hero(
          tag: 'pic',
          child: Image.asset('images/liu.webp', width: double.infinity,),
        ),
      ),
    );
  }
}





