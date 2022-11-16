import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}
class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountNotifier>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Provider'),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter.increment();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(counter.count.toString()),
      ),
    );
  }
}

class CountNotifier extends ChangeNotifier{
  int count = 0;
  void increment(){
    count++;
    notifyListeners();
  }
}


class InheritedProvider<T> extends InheritedWidget{
  InheritedProvider({
    required this.data,
    required Widget child,
  }):super(child: child);
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget){
    return true;
  }
}