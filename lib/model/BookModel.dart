class BookModel{
  static final _books = [
    Book(1,'插翅难逃'),
    Book(2,'西城往事'),
    Book(3,'偷偷藏不住'),
    Book(4,'黑白'),
    Book(5,'我终究是爱你的'),
    Book(6,'凉风有信'),
  ];
  //获取书籍长度
  int get length => _books.length;
  //根据ID获取书籍
  Book getById(int id) => _books[id - 1];
  // 根据索引获取数据
  Book getByPosition(int position) => _books[position];

}

class Book{
  final int bookId;
  final String bookName;
  Book(this.bookId,this.bookName);
}
