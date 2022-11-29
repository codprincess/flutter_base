import 'package:flutter/material.dart';

class DatePickerPage2 extends StatefulWidget {
  const DatePickerPage2({Key? key}) : super(key: key);

  @override
  State<DatePickerPage2> createState() => _DatePickerPage2State();
}

class _DatePickerPage2State extends State<DatePickerPage2> {
  DateTime? _selectDateTime;
  void _showDatePicker() async{
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: '选择日期',
      cancelText: '取消',
      confirmText: '确定',
      initialDatePickerMode: DatePickerMode.day,
      builder: (context, Widget? child){
        return Theme(
          data: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red
              )
            ),
            colorScheme: const ColorScheme.light(
              primary: Colors.red,
              onPrimary: Colors.white
            ),

          ),
          child: child!,
        );
      }
    );
    setState(() {
      _selectDateTime = result;
      print(_selectDateTime);
    });
  }
  //showTimePicker
  String? _selectDateTime2;
  Future<void> _showTimePicker() async{
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
        helpText: '选择日期',
        cancelText: '取消',
        confirmText: '确定',

        builder: (context, Widget? child){
          return Theme(
            data: ThemeData(
              timePickerTheme: TimePickerThemeData(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                hourMinuteShape: const CircleBorder(),
              ),
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.red
                  )
              ),
              colorScheme: const ColorScheme.light(
                  primary: Colors.red,
                  onPrimary: Colors.white
              ),

            ),
            child: child!,
          );
        }
    );
    if(result != null){
      setState(() {
        _selectDateTime2 = result.format(context);
        print(_selectDateTime2);
      });
    }
  }

  //showTimePicker 24小时制
  String? _selectDateTime3;
  Future<void> _showTimePicker3() async{
    final TimeOfDay?  result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context , child){
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true
          ),
          child: child!,
        );
      }
    );
    if(result != null){
      setState(() {
        _selectDateTime3 = result.format(context);
        print(_selectDateTime3);
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('日期选择器'),),
      body: Center(
        child: Column(
          children: [
            Container(
              padding:const EdgeInsets.all(30),
              child: Text(_selectDateTime != null ? _selectDateTime.toString():'未选择时间'),
            ),
            ElevatedButton(
                onPressed: (){_showDatePicker();},
                child: const Text('showDatePicker',)
            ),

            Container(
              padding:const EdgeInsets.all(30),
              child: Text(_selectDateTime2 != null ? _selectDateTime2!:'未选择时间'),
            ),
            ElevatedButton(
                onPressed: (){_showTimePicker();},
                child: const Text('showTimePicker',)
            ),
            Container(
              padding:const EdgeInsets.all(30),
              child: Text(_selectDateTime3 != null ? _selectDateTime3!:'未选择时间'),
            ),
            ElevatedButton(
                onPressed: (){_showTimePicker3();},
                child: const Text('showTimePicker',)
            ),

          ],
        ),
      ),
    );
  }
}
