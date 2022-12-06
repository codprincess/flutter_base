import 'package:flutter/material.dart';
class ModalBarrierPage extends StatelessWidget {
  const ModalBarrierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ModalBarrier'),),
      body: Stack(
        children:  const [
          Opacity(
            opacity: 0.3,
            child: ModalBarrier(
              dismissible: true,
              color: Colors.black87,
            ),
          ),
          Center(child: Text('Hello'),)
        ],
      ),
    );
  }
}


