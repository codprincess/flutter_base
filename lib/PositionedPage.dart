import 'package:flutter/material.dart';

class PositionedPage extends StatelessWidget {
  const PositionedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Positioned'),),
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple
                  ),
                )
              ),
              Positioned(
                top: 150,
                left: 150,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red
                  ),
                )
              ),
              Positioned(
                  top: -50,
                  left: 100,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
