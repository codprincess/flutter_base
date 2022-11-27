import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<List> _loadData() async{
    List posts = [];
    try{
      const apiUrl = 'https://jsonplaceholder.typicode.com/posts';
      final http.Response response = await http.get(Uri.parse(apiUrl));
      //print(response.body);
      posts = jsonDecode(response.body);
    }catch(err){
      print(err);
    }
    return posts;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FutureBuilder'),),
      body: FutureBuilder(
        future: _loadData(),
        builder: (BuildContext ctx,AsyncSnapshot<List>snapshot){
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context,index){
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        contentPadding:const EdgeInsets.all(10),
                        title: Text(snapshot.data![index]['title']),
                        subtitle: Text(snapshot.data![index]['body']),
                      ),
                    );
                  }
              )
              : const Center(
                child: CircularProgressIndicator(),
              );
        },
      ),
    );
  }
}
