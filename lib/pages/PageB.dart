import 'package:flutter/material.dart';
import 'package:flutter_base/pages/PageA.dart';
import 'package:provider/provider.dart';

import '../model/BookManagerModel.dart';

class PageB extends StatelessWidget {
  const PageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookManagerModel = Provider.of<BookManagerModel>(context);
    var bookCount = bookManagerModel.length;
    return Scaffold(
      appBar: AppBar(title: const Text('收藏列表'),),
      body: ListView.builder(
        itemCount: bookCount,
        itemBuilder: (context,index) => BookItem(id: bookManagerModel.getByPosition(index).bookId),
      ),
    );
    
  }
}
