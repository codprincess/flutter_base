import 'package:flutter/material.dart';

class SliverFadeTransitionPage extends StatefulWidget {
  const SliverFadeTransitionPage({Key? key}) : super(key: key);

  @override
  State<SliverFadeTransitionPage> createState() => _SliverFadeTransitionPageState();
}

class _SliverFadeTransitionPageState extends State<SliverFadeTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliverFadeTransition'),),
      body: const Center(
        child: MyStatefulWidget(),
      ),
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  );
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverFadeTransition(
          opacity: animation,
          sliver: SliverToBoxAdapter(
            child: Center(
              child: Image.asset(
                "images/liu.webp",
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ))
    ]);
  }
}

