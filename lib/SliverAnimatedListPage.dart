import 'package:flutter/material.dart';

class SliverAnimatedListPage extends StatefulWidget {
  const SliverAnimatedListPage({Key? key}) : super(key: key);

  @override
  State<SliverAnimatedListPage> createState() => _SliverAnimatedListPageState();
}

class _SliverAnimatedListPageState extends State<SliverAnimatedListPage> {
  final _listKey = GlobalKey<SliverAnimatedListState>();
  late List<int> _list;
  int? _selectedItem;
  late int _nextItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = <int>[0,1,2];
    _nextItem = 3;
  }
  void _insert(){
    final int index = _selectedItem == null?_list.length:_list.indexOf(_selectedItem!);
    _list.insert(index, _nextItem++);
    _listKey.currentState!.insertItem(index);
  }

  void _remove(){
    final int index = _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
    _list.removeAt(index);
    _listKey.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: Card(
            child: Center(
              child: Text('选中删除',style: Theme.of(context).textTheme.headline4,),
            ),
          ),
        ));
        setState(() {
          _selectedItem = null;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('SliverAnimatedList'),
            expandedHeight: 60,
            centerTitle: true,
            backgroundColor: Colors.amber,
            leading: IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: _insert,
              tooltip: 'insert a new item',iconSize: 32,
            ),
            actions: [
              IconButton(
                onPressed: _remove,
                icon: const Icon(Icons.remove_circle),
                tooltip: 'remove item',
                iconSize: 32,
              )
            ],
          ),
          SliverAnimatedList(
            key: _listKey,
            initialItemCount: _list.length,
            itemBuilder: _buildItem,
          )
        ],
      ),
    );
  }
  Widget _buildItem(BuildContext context,int index,Animation<double> animation){
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: (){
          setState(() {
            _selectedItem = _selectedItem==_list[index] ? null :_list[index];
          });
      },
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.animation, this.onTap, required this.item,  this.selected = false}) : assert(item >= 0), super(key: key);
  final Animation<double> animation;
  final VoidCallback? onTap;
  final int item;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2.0,
        right: 2.0,
        top: 2.0,
        bottom: 0.0,
      ),
      child: FadeTransition(
        opacity: animation,
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 80.0,
            child: Card(
              color: selected?Colors.black12:Colors.primaries[item % Colors.primaries.length],
              child: Center(
                child: Text('Item $item',style: Theme.of(context).textTheme.headline4,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


