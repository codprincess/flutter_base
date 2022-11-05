import 'package:flutter/material.dart';

class FromRadio extends StatefulWidget {
  const FromRadio({Key? key}) : super(key: key);
  @override
  State<FromRadio> createState() => _FromRadioState();
}

class _FromRadioState extends State<FromRadio> {
  final List<FromRadioModel> _datas = [];
  int groupValue = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData(){
    _datas.add(FromRadioModel(1, '游戏'));
    _datas.add(FromRadioModel(2, '社交'));
    _datas.add(FromRadioModel(3, '购物'));
    _datas.add(FromRadioModel(4, '娱乐'));
    _datas.add(FromRadioModel(5, '影视'));
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('radio的实例'),),
      body: ListView.builder(
          itemCount: _datas.length,
          itemBuilder: (context,index){
            FromRadioModel model = _datas[index];
            return _buildRow(model);
          }
      ),
      bottomSheet: _bottomSheet(),
    );
  }

  BottomSheet _bottomSheet(){
    return BottomSheet(
        onClosing: (){},
        builder: (BuildContext context){
          return Container(
            height: 60,
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(_selectedBoxs()),
          );
        }
    );
  }
 String _selectedBoxs(){
    String string = '';
    for (var model in _datas) {
      if(model.index == groupValue){
        string = "你当前选择的是: " + "${model.text}  ";
      }
    }
    return string;
 }


  Row _buildRow(FromRadioModel model){
    return Row(
      children: [
        _radio(model),
        Text(model.text)
      ],
    );
  }

  Radio _radio(FromRadioModel model){
    return Radio(
        value: model.index,
        groupValue: groupValue,
        onChanged: (index){
          groupValue = index;
          print(index);
          setState(() {
            //groupValue = index;
          });
        }
    );
  }


}
class FromRadioModel extends Object{
  int index ;
  String text;
  FromRadioModel(this.index,this.text);
}


