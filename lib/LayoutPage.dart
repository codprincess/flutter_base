import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Container(
    //     color: Colors.red,
    //     padding: const EdgeInsets.all(20.0),
    //
    //     child: Container(
    //       color: Colors.green,
    //       width: 50,
    //       height: 50,
    //     ),
    //   ),
    // );
    // return Center(
    //   child: ConstrainedBox(
    //     constraints: const BoxConstraints(
    //       minHeight: 70,
    //       minWidth: 70,
    //       maxHeight: 150,
    //       maxWidth: 150,
    //     ),
    //     child: Container(
    //       color: Colors.red,
    //       width: 20,
    //       height: 20,
    //     ),
    //   ),
    // );
    // return UnconstrainedBox(
    //   child: LimitedBox(
    //     maxWidth: 100,
    //     child: Container(
    //       color: Colors.red,
    //       width: double.infinity,
    //       height: 50,
    //     ),
    //   ),
    // );

    // return OverflowBox(
    //   minHeight: 0.0,
    //   minWidth: 0.0,
    //   maxHeight: double.infinity,
    //   maxWidth: double.infinity,
    //   child: Container(
    //     color: Colors.red,
    //     width: 3000,
    //     height: 50,
    //   ),
    // );

    return  const Center(
      child:  FittedBox(
        child: Text('Some Example Text.'),
      ),
    );

  }
}
