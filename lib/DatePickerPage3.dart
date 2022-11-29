import 'package:flutter/material.dart';

class DatePickerPage3 extends StatefulWidget {
  const DatePickerPage3({Key? key}) : super(key: key);

  @override
  State<DatePickerPage3> createState() => _DatePickerPage3State();
}

class _DatePickerPage3State extends State<DatePickerPage3> {
  String? _selectDateTimeRange;
  Future<DateTimeRange?> _showRangeDatePickerForDay() async{
   final DateTimeRange? result = await  showDateRangePicker(
      context: context,
      firstDate: DateTime(2022,1,1),
      lastDate: DateTime(2026,12,12),
      currentDate: DateTime.now(),
      initialDateRange: DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 5)),
        end: DateTime.now().add(const Duration(days: 5))
      ),
      initialEntryMode: DatePickerEntryMode.calendar,
      helpText: '请选择日期区间',
      cancelText: '取消',
      confirmText: '确定',
      saveText: '完成',
      errorFormatText: '输入格式有错误',
      errorInvalidRangeText: '开始日期不可以在结束之后',
      errorInvalidText: '输入不合法',
      builder: (context,child){
        return Theme(
          data: ThemeData(primarySwatch: Colors.amber),
          child: child!
        );
      }
    );

   setState(() {
     _selectDateTimeRange = result.toString();
     print(_selectDateTimeRange);
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('showDateRangePicker'),),
      body: Center(
        child: Column(
          children: [
            Container(
              padding:const EdgeInsets.all(30),
              child: Text(_selectDateTimeRange != null ? _selectDateTimeRange!:'未选择时间'),
            ),
            ElevatedButton(
                onPressed: (){_showRangeDatePickerForDay();},
                child: const Text('showTimePicker',)
            ),
          ],
        ),
      ),
    );
  }
}
