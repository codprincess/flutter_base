import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  //滑动控制
   final PageController _pageController = PageController(initialPage: 0,viewportFraction: 1);
  //当前页
  int _activePage = 0;

  final List<Widget> _pages =[
    const PageOne(),
    const PageTwo(),
    const PageThree()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
         PageView.builder(
           controller: _pageController,
           onPageChanged: (int page){
             setState(() {
               _activePage = page;
               print(page);
             });
           },
           itemCount: _pages.length,
           itemBuilder:(BuildContext context,int index){
             return _pages[index % _pages.length];
           }
         ),
         //指示器
         Positioned(
           bottom: 0,
           left: 0,
           right: 0,
           height: 100,
           child: Container(
              color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: (){
                      _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      print(index);
                    },
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: _activePage == index? Colors.amber:Colors.grey,
                    ),

                  ),
                )),
              ),
           )
         )
       ],
     ),
    );
  }

}
//第一页
class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.indigo,
      child: const Text('Page 1',style: TextStyle(fontSize: 48,color: Colors.white),),
    );
  }
}
//第二页
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.deepOrange,
      child: const Text('Page 2',style: TextStyle(fontSize: 48,color: Colors.white),),
    );
  }
}
//第三页
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.purple,
      child: const Text('Page 3',style: TextStyle(fontSize: 48,color: Colors.white),),
    );
  }
}

