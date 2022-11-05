import 'package:flutter/material.dart';

class showBottomSheetPage extends StatefulWidget {
  const showBottomSheetPage({Key? key}) : super(key: key);
  @override
  State<showBottomSheetPage> createState() => _showBottomSheetPageState();
}

class _showBottomSheetPageState extends State<showBottomSheetPage> {
  bool _isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('showBottomSheet'),),
      body:  Padding(
        padding: const EdgeInsets.all(2),
        child:Column(
          children: [
            ElevatedButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return  AlertDialog(
                          icon: const Icon(Icons.ac_unit_sharp),//图标
                          title: const Text('AlertDialog'),
                          titlePadding: const EdgeInsets.all(20),
                          titleTextStyle: const TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),
                          content: const Text('我是AlertDialog对话框'),
                          contentPadding: const EdgeInsets.all(40),
                          contentTextStyle: const TextStyle(color: Colors.black,fontSize: 16),
                          backgroundColor: Colors.grey,
                          elevation: 10.0,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          actions: [
                            TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('确定')),
                            TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('取消'))
                          ],
                          actionsOverflowDirection: VerticalDirection.down,
                        );
                      }
                  );
                },
                child: const Text('AlertDialog')
            ),



            ElevatedButton(
                onPressed: (){
                  showDialog(context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Row(children: <Widget>[
                              Padding(child: Text('Alert 性别选择'), padding: EdgeInsets.only(left: 12.0)) ]),
                            titleTextStyle: TextStyle(color: Colors.pinkAccent, fontSize: 18.0, fontWeight: FontWeight.w600),
                            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                              Row(children: <Widget>[
                                Expanded(child: GestureDetector(child: Container(child: Image.asset('images/avatar.jpg'), width: 105.0),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                     // Toast.show('AlertDialog Boy!', context, duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM);
                                    })),
                                Expanded(child: GestureDetector(child: Container(child: Image.asset('images/avatar.jpg'), width: 105.0),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      //Toast.show('AlertDialog Girl!', context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                                    })) ]),
                              Row(children: <Widget>[
                                Expanded(child: Center(child: Text('男生', style: TextStyle(color: Colors.blueAccent, fontSize: 16.0, fontWeight: FontWeight.w300)))),
                                Expanded(child: Center(child: Text('女生'))) ])
                            ]),
                            contentTextStyle: TextStyle(color: Colors.pinkAccent, fontSize: 16.0, fontWeight: FontWeight.w300),
                            contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 0.0),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                            actions: <Widget>[
                              TextButton(child: Text("确定"), onPressed: () => Navigator.of(context).pop()),
                              TextButton(child: Text("取消"), onPressed: () => Navigator.of(context).pop())
                            ]);
                      });
                },
                child: Text('235435')
            ),

            ElevatedButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Row(children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text('Alert List'),
                          )
                        ],),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const [
                              Text('List1'),
                              Text('List2'),
                              Text('List3'),
                              Text('List4'),
                              Text('List5'),
                              Text('List6'),
                              Text('List7'),
                              Text('List8'),
                              Text('List9'),
                              Text('List10'),
                              Text('List11'),
                              Text('List12'),
                              Text('List13'),
                            ],
                          )
                        ),
                        //content: Text("1111111"),
                        // content: ListView.builder(
                        //   itemCount: 20,
                        //   itemBuilder: (BuildContext context, int index){
                        //     return ListTile(
                        //       title: Text('当前 index = $index'),
                        //       //onTap: (){Navigator.of(context).pop(index);},
                        //     );
                        //   }
                        // ),
                        elevation: 8.0,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                      );
                    }
                );
              },
              child: const Text('AlertDialog2')
            ),

            ElevatedButton(
                onPressed: (){
                  showDialog(context: context,
                      builder: (context) {
                        return SimpleDialog(
                            title: const Text('SimpleDialog', style: TextStyle(color: Colors.blueAccent)),
                            children: <Widget>[
                              const Padding(child: Text('我是 SimpleDialog 对话框？'), padding: EdgeInsets.all(20.0)),
                              SimpleDialogOption(child: Text('选项1'), onPressed: () => Navigator.pop(context)),
                              SimpleDialogOption(child: Text('选项2'), onPressed: () => Navigator.pop(context))
                            ]
                        );
                      });
                },
                child: const Text('SimpleDialog')
            ),
            ElevatedButton(
                onPressed: (){
                  showDialog(context: context,
                      builder: (context) {
                        return SimpleDialog(
                            title: Row(children: const <Widget>[
                              Padding(padding: EdgeInsets.only(left: 12.0), child: Text('Simple List'))
                            ]),
                            elevation: 10.0,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                            children: <Widget>[
                              SizedBox(height: 400.0,
                                  child: ListView.builder(
                                      itemCount: 30,
                                      itemBuilder: (BuildContext context, int index) {
                                        return ListTile(title: Text('当前 index = $index'), onTap: () => Navigator.of(context).pop(index));
                                      }
                                 )
                              )
                            ]
                        );
                      });
                },
                child: const Text('SimpleDialog')
            ),

            ElevatedButton(
                onPressed: (){
                  showDialog(context: context,
                      builder: (context) {
                        return const AboutDialog(
                          applicationIcon: Icon(Icons.apple),
                          applicationName: '苹果',
                          applicationVersion: 'V1.2.6',
                          applicationLegalese: '此版本非该公司所有',
                          children: [
                            Text('选项1'),
                            Text('选项2'),
                            Text('选项3'),
                          ],
                        );
                      });
                },
                child: const Text('AboutDialog')
            ),
          ],
        )
      ),
      // bottomSheet: BottomSheet(
      //   enableDrag: false,
      //   onClosing: (){},
      //   builder: (context){
      //     return Container(
      //       color: Colors.cyan,
      //       height: 200,
      //       alignment: Alignment.center,
      //       child: const Text('BottomSheet'),
      //     );
      //   },
      // ),
      //floatingActionButton: _buildFloatingActionButton(),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.radar),
      //   onPressed: (){
      //     showModalBottomSheet(
      //         context: context,
      //         builder: (context){
      //           return Container(
      //             height: 100,
      //             child: Column(
      //               children: [
      //                 TextButton(
      //                     onPressed: (){
      //                       Navigator.of(context).pop();
      //                     },
      //                     child: const Text('保存'),
      //                 ),
      //                 TextButton(
      //                   onPressed: (){
      //                     Navigator.of(context).pop();
      //                   },
      //                   child: const Text('取消'),
      //                 ),
      //               ],
      //             )
      //           );
      //         }
      //     );
      //   },
      // ),
    );
  }
  Widget _buildFloatingActionButton(){
    return Builder(
        builder: (context){
          return FloatingActionButton(
            onPressed: (){
              _floatingActionButtonEvent(context);
              _isShow = !_isShow;
            },
            child: const Icon(Icons.ac_unit_sharp),
          );
        }
    );
  }

  _floatingActionButtonEvent(BuildContext context){
    if(_isShow){
      Navigator.of(context).pop();
    }else{
      _showSheet(context);
    }
  }
  void _showSheet(BuildContext context){
    showBottomSheet(
        context: context,
        builder: (context){
          return Container(
            width: double.infinity,
            height: 200,
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('showBottomSheet'),
          );
        }
    );
  }
}
