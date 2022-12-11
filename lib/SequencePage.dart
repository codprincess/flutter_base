import 'package:flutter/material.dart';

class SequencePage extends StatefulWidget {
  const SequencePage({Key? key}) : super(key: key);

  @override
  State<SequencePage> createState() => _SequencePageState();
}

class _SequencePageState extends State<SequencePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> profileTopAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> profileMenuAnimation;
  late Animation<double> signOutBtnAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this
    );
    profileTopAnimation = Tween<double>(begin: -200.0,end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0,0.125, curve: Curves.easeOut))
    );
    textOpacityAnimation = Tween<double>(begin: 0.0,end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.125,0.25, curve: Curves.easeIn))
    );
    profileMenuAnimation = Tween<double>(begin: -500.0,end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.25,0.375,curve: Curves.fastLinearToSlowEaseIn))
    );
    signOutBtnAnimation = Tween<double>(begin: 0.0,end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.375,0.5, curve: Curves.elasticOut))
    );

    _controller.addListener(() {
      setState(() {

      });
    });

    _controller.forward();

  }
  final List<Map<String, dynamic>> profileMenu = [
    {
      "title": "Goals",
      "color": const Color(0xff4F375A),
      "icon": Icons.circle_outlined
    },
    {
      "title": "My Body",
      "color": const Color(0xff393C87),
      "icon": Icons.person,
    },
    {
      "title": "Settings",
      "color": const Color(0xff213D82),
      "icon": Icons.settings,
    },
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2F2B53),
      appBar: AppBar(
        title: const Text('交错/序列动画'),
        backgroundColor: const Color(0xff2F2B53),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: Offset(0.0,profileTopAnimation.value),
              child: const ProfileTop(),
            ),
            const SizedBox(height: 12,),
            Opacity(
              opacity: textOpacityAnimation.value,
              child: const Text('JING',style: TextStyle(
                fontSize: 44,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),),
            ),
            const SizedBox(
              height: 60,
            ),
            Transform.translate(
              offset: Offset(profileMenuAnimation.value,0.0),
              child: ProfileMenu(profileMenu:profileMenu,),
            ),
            Transform.scale(
              scale: signOutBtnAnimation.value,
              child: const SignOutBtn(),
            )
          ],
        ),
      ),
    );
  }
}

class SignOutBtn extends StatelessWidget {
  const SignOutBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: SizedBox(
        height: 60,
        width: 150,
        child: ElevatedButton.icon(
          onPressed: (){},
          icon: const Icon(Icons.login_outlined,color: Colors.redAccent,),
          label: const Text('Sign Out',style: TextStyle(fontSize: 18),),
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color(0xff3D3A63),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),
        ),
      ),
    );
  }
}


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key, required this.profileMenu}) : super(key: key);
  final List<Map<String,dynamic>> profileMenu;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        itemBuilder: (context,index){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: profileMenu[index]['color'],
                    child: Center(
                      child: Icon(
                        profileMenu[index]['icon'],
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Text(
                    profileMenu[index]['title'],
                    style: const TextStyle(color: Colors.white,fontSize: 22),
                  )
                ],
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xff3D3A63),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              )
            ],
          );
          
        },
        separatorBuilder: (context,index){
          return const SizedBox(height: 40);
        },
        itemCount: profileMenu.length
      ),
    );
  }
}


class ProfileTop extends StatelessWidget {
  const ProfileTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 70,
          backgroundImage:AssetImage('images/avatar.jpg')
        ),
        Row(
          children: [
            Container(
              color: Colors.grey,
              width: 1,
              height: 100,
            ),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('HEDY',style: TextStyle(color: Colors.blueGrey[100],fontSize: 18),),
                const SizedBox(height: 10,),
                const Text('8 min ago',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        )
      ],
    );
  }
}

