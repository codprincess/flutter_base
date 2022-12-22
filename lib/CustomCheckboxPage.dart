import 'package:flutter/material.dart';
import 'package:flutter_base/CustomCheckbox.dart';

class CustomCheckboxPage extends StatefulWidget {
  const CustomCheckboxPage({Key? key}) : super(key: key);

  @override
  State<CustomCheckboxPage> createState() => _CustomCheckboxPageState();
}

class _CustomCheckboxPageState extends State<CustomCheckboxPage> {
  bool _checkboxSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('自定义复选框'),),
      body: Center(
        child: Column(
          children: [
            CustomCheckbox(
              isChecked: _checkboxSelected,
              onChange: (value){
                _checkboxSelected = value;
              },
              selectedColor: Colors.black,
              size: 30,
              iconSize: 20,
            ),
            // Checkbox(
            //
            // )
          ],
        ),
      ),
    );
  }
}
