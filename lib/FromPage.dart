import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FromPage extends StatefulWidget {
  const FromPage({Key? key}) : super(key: key);

  @override
  State<FromPage> createState() => _FromPageState();
}

class _FromPageState extends State<FromPage> {
  int sex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('表单之多选'),),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // Form(
            //   autovalidateMode: AutovalidateMode.always,
            //   child: Column(
            //     children: [
            //       TextFormField(
            //         onSaved: (value){
            //           print(value);
            //         },
            //         autovalidateMode: AutovalidateMode.always,
            //         validator: (value){
            //           return value!.trim().isNotEmpty ? null : "用户名不能为空";
            //         },
            //       )
            //     ],
            //   )
            // ),

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
                          //content: Text("1111111"),
                          content: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index){
                                return ListTile(
                                  title: Text('index = $index'),
                                  //onTap: (){Navigator.of(context).pop(index);},
                                );
                              }
                          ),
                          elevation: 8.0,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                        );
                      }
                  );
                },
                child: const Text('AlertDialog2')
            )


          ],
        ),
      ),

    );
  }
}