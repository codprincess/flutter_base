import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime? _selectDateTime;
  Duration? _selectTime;
  var now = DateTime.now();
  void _showDatePicker(context){
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 500,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Localizations(
                locale: const Locale('zh'),
                delegates:const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  use24hFormat: true,
                  dateOrder: DatePickerDateOrder.dmy,
                  minimumDate: DateTime(2021, 10, 10),
                  maximumDate: DateTime(2023, 12, 22),
                  minimumYear: 2020,
                  maximumYear: 2025,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (val){
                    setState(() {
                      _selectDateTime = val;
                    });
                  },
                ),
              ),
            ),
            TextButton(
              child: const Text('确定'),
              onPressed: (){
                Navigator.of(context).pop();
              }
            )
          ],
        ),
      )
    );

  }

  void _showDatePicker2(context){
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 500,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Localizations(
                locale:const Locale('zh'),
                delegates:const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hms,
                  initialTimerDuration: Duration(hours: now.hour,minutes: now.minute,seconds: now.second),
                  minuteInterval: 1,
                  secondInterval: 1,
                  alignment: Alignment.center,
                  backgroundColor: Colors.white,
                  onTimerDurationChanged: (Duration duration){
                    _selectTime = duration;
                    // print(duration);
                    print(_selectTime);
                 },
                ),
              ),
            ),
            CupertinoButton(
              child: const Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _selectTime = _selectTime;
                });
              },
            )
          ],
        ),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('日历'),),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding:const EdgeInsets.all(30),
                child: Text(_selectDateTime != null?_selectDateTime.toString():'未选择时间'),
              ),
              ElevatedButton(
                onPressed: (){
                  _showDatePicker(context);
                },
                child: const Text('CupertinoDatePicker')
              ),
              Container(
                padding:const EdgeInsets.all(30),
                child: Text(_selectTime != null ? _selectTime.toString():'未选择时间'),
              ),
              ElevatedButton(
                  onPressed: (){
                    _showDatePicker2(context);
                  },
                  child: const Text('CupertinoTimePicker')
              )

            ],
          ),
        ),
      ),
    );
  }
}
