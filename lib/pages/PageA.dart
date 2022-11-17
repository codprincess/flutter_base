import 'package:flutter/material.dart';
import 'package:flutter_base/model/BookManagerModel.dart';
import 'package:flutter_base/model/BookModel.dart';
import 'package:provider/provider.dart';

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取书籍列表数据
    var bookLists = Provider.of<BookModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('书籍列表'),),
      body: ListView.builder(
        itemCount: bookLists.length,
        itemBuilder: (context,index) => BookItem(id:index+1)
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final int id;
  const BookItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookLists = Provider.of<BookModel>(context);
    var book = bookLists.getById(id);
    return ListTile(
      leading: CircleAvatar(
        child: Text("${book.bookId}"),
      ),
      title: Text(book.bookName,style: const TextStyle(
        color: Colors.black87
      ),),
      trailing: BookButton(book:book),
    );
  }
}

class BookButton extends StatelessWidget {
  final Book book;
  const BookButton({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final bookManagerModel = Provider.of<BookManagerModel>(context);
    return GestureDetector(
      onTap: (bookManagerModel.books!).contains(book)
          ? ()=>bookManagerModel.removeBook(book)
          : ()=>bookManagerModel.addBook(book),
      child: SizedBox(
        width: 100,
        height: 60,
        child: (bookManagerModel.books!).contains(book)
            ? const Icon(Icons.star,color: Colors.red,)
            : const Icon(Icons.star_border),
      ),
    );
  }
}


