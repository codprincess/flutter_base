import 'package:flutter/material.dart';

class BorderPage extends StatelessWidget {
  const BorderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('border的详解'),),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //     width: 200,
          //     height: 100,
          //     decoration: const BoxDecoration(
          //       border: Border(
          //         top: BorderSide(width: 5,color: Colors.red),
          //         left: BorderSide(width: 5,color: Colors.green),
          //         right: BorderSide(width: 5,color: Colors.pink),
          //         bottom: BorderSide(width: 5,color: Colors.orange),
          //       )
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //     width: 200,
          //     height: 100,
          //     decoration:  BoxDecoration(
          //        border: Border.all(
          //          width: 5.0,
          //          color: Colors.red,
          //        )
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //     width: 200,
          //     height: 100,
          //     decoration:  const BoxDecoration(
          //         border: Border.fromBorderSide(
          //           BorderSide(
          //             width: 5.0,
          //             color: Colors.green,
          //             style: BorderStyle.solid
          //           )
          //         )
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //     width: 200,
          //     height: 100,
          //     decoration:  const BoxDecoration(
          //         border: Border.symmetric(
          //           vertical: BorderSide(
          //             width: 5.0,
          //             color: Colors.green,
          //             style: BorderStyle.solid
          //           ),
          //           horizontal: BorderSide(
          //             width: 4,
          //             color: Colors.blue,
          //             style: BorderStyle.solid
          //           )
          //         )
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 200,
              height: 100,
              decoration:  ShapeDecoration(
                color: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(
                    width: 6.0,
                    color: Colors.red,
                  )
                ) +  const CircleBorder(
                    side: BorderSide(
                      width: 10.0,
                      color: Colors.green,
                    )
                )
              )
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                width: 150,
                height: 150,
                decoration:  const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(
                        side: BorderSide(
                          width: 10.0,
                          color: Colors.red,
                        )
                    )
                ),
                child: Center(
                  child: Image.asset('images/avatar.jpg',width: 100,height: 100,),
                )
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //       width: 150,
          //       height: 50,
          //       decoration:  ShapeDecoration(
          //           color: Colors.white,
          //           shape:ContinuousRectangleBorder(
          //             borderRadius: BorderRadius.circular(10.0),
          //             side: const BorderSide(
          //               width: 5.0,
          //               color: Colors.green
          //             )
          //           )+ContinuousRectangleBorder(
          //               borderRadius: BorderRadius.circular(10.0),
          //               side: const BorderSide(
          //                   width: 10.0,
          //                   color: Colors.red
          //               )
          //           )
          //       ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //       width: 150,
          //       height: 75,
          //       decoration:  const ShapeDecoration(
          //           color: Colors.white,
          //           shape: ContinuousRectangleBorder(
          //             borderRadius: BorderRadius.only(
          //               bottomLeft: Radius.zero,
          //               topLeft: Radius.zero,
          //               bottomRight: Radius.zero,
          //               topRight: Radius.circular(45.0)
          //             ),
          //             side: BorderSide(
          //               width: 5,
          //               color: Colors.blue,
          //             )
          //           )
          //       ),
          //
          //   ),
          // ),

          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //     width: 150,
          //     height: 75,
          //     decoration:  const ShapeDecoration(
          //         color: Colors.white,
          //         shape: ContinuousRectangleBorder(
          //             borderRadius: BorderRadius.only(
          //                 bottomLeft: Radius.zero,
          //                 topLeft: Radius.zero,
          //                 bottomRight: Radius.zero,
          //                 topRight: Radius.circular(45.0)
          //             ),
          //             side: BorderSide(
          //               width: 5,
          //               color: Colors.blue,
          //             )
          //         )
          //     ),
          //
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //     width: 150,
          //     height: 75,
          //     decoration:   ShapeDecoration(
          //         color: Colors.white,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10.0),
          //             side: const BorderSide(
          //               width: 5,
          //               color: Colors.blue,
          //             )
          //         )+RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10.0),
          //             side: const BorderSide(
          //               width: 2,
          //               color: Colors.red,
          //             )
          //         )
          //     ),
          //
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 150,
              height: 75,
              decoration:   const ShapeDecoration(
                  color: Colors.white,
                  shape: StadiumBorder(
                    side: BorderSide(
                      width: 5.0,
                      color: Colors.green
                    )
                  )
              ),

            ),
          ),

           Padding(
            padding: const EdgeInsets.all(20.0),
            child:ElevatedButton(
              child: const Text('实例按钮'),
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(width: 3,color: Colors.green),
                shape: const StadiumBorder(
                  side: BorderSide(width: 5,color: Colors.blue),//被覆盖
                )
              ),
            )
          ),



        ],
      ),
    );
  }
}
