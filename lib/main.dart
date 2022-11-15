import 'package:flutter/material.dart';
import 'package:flutter_base/AnimatedListPage.dart';
import 'package:flutter_base/AppPage.dart';
import 'package:flutter_base/BorderPage.dart';
import 'package:flutter_base/BottomAppBarPage.dart';
import 'package:flutter_base/BoxDecorationPage.dart';
import 'package:flutter_base/FromPage.dart';
import 'package:flutter_base/FromRadio.dart';
import 'package:flutter_base/GridViewPage.dart';
import 'package:flutter_base/ImagePage.dart';
import 'package:flutter_base/IndicatorPage.dart';
import 'package:flutter_base/LayoutPage.dart';
import 'package:flutter_base/ListViewPage.dart';
import 'package:flutter_base/LoginPage.dart';
import 'package:flutter_base/NestedScrollViewPage.dart';
import 'package:flutter_base/PaddingPage.dart';
import 'package:flutter_base/PageViewPage.dart';
import 'package:flutter_base/RowPage.dart';
import 'package:flutter_base/ScaffoldPage.dart';
import 'package:flutter_base/SliverAnimatedListPage.dart';
import 'package:flutter_base/SliverAnimatedOpacityPage.dart';
import 'package:flutter_base/SliverFadeTransitionPage.dart';
import 'package:flutter_base/SliverLayoutBuilderPage.dart';
import 'package:flutter_base/SliverPaddingPage.dart';
import 'package:flutter_base/SliverPersistentHeaderPage.dart';
import 'package:flutter_base/SliverSafeAreaPage.dart';
import 'package:flutter_base/SliverToBoxAdapterPage.dart';
import 'package:flutter_base/SvPage.dart';
import 'package:flutter_base/TestPage.dart';
import 'package:flutter_base/TextPage.dart';
import 'package:flutter_base/SliverOpacityPage.dart';
import 'package:flutter_base/WillPopScopePage.dart';
import 'package:flutter_base/showBottomSheetPage.dart';
import 'CustomScrollViewPage.dart';
import 'FlowViewPage.dart';
import 'InheritedWidgetPage.dart';
import 'RoutePage.dart';
import 'SliverAppBarPage.dart';
import 'SliverFillViewportPage.dart';
import 'SliverGridPage.dart';
import 'SliverPrototypeExtentListPage.dart';
import 'SliverVisibilityPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',//名为"/"的路由作为应用的home(首页)
      //注册路由
      routes: {
        '/':(context)=> MyHomePage(title: '样式实例入口'),//注册首页路由
        'route_page':(context)=> RoutePage(),
        'text_page':(context)=>TextPage(),
        'image_page':(context)=>ImagePage(),
        'from_page':(context)=>FromPage(),
        'from_radio':(context)=>FromRadio(),
        'login_page':(context)=>LoginPage(),
        'layout_page':(context)=>LayoutPage(),
        'row_page':(context)=>RowPage(),
        'padding_page':(context)=>PaddingPage(),
        'app_page':(context)=>AppPage(),
        'bottomappbar_page':(context)=>BottomAppBarPage(),
        'scaffold_page':(context)=>ScaffoldPage(),
        // 'indicator_page':(context)=>IndicatorPage(),
        'dialog_page':(context)=>showBottomSheetPage(),
        'border_page':(context)=>BorderPage(),

        'BoxDecoration_Page':(context)=>BoxDecorationPage(),
        'sv_page':(context)=>SvPage(),
        'listview_page':(context)=>ListViewPage(),
        'test_page':(context)=>TestPage(),
        'AnimatedList_page':(context)=>AnimatedListPage(),
        'gridview_page':(context)=>GridViewPage(),
        'pageview_page':(context)=>PageViewPage(),
        'CustomScrollView_Page':(context)=>CustomScrollViewPage(),
        'SliverAnimatedList_page':(context)=>SliverAnimatedListPage(),
        'SliverGrid_Page':(context)=>SliverGridPage(),
        'SliverAppBar_Page':(context)=>SliverAppBarPage(),
        'SliverPersistentHeader_Page':(context)=>SliverPersistentHeaderPage(),
        'SliverToBoxAdapter_Page':(context)=>SliverToBoxAdapterPage(),
        'SliverFillViewport_Page':(context)=>SliverFillViewportPage(),
        'SliverPrototypeExtentList_Page':(context)=>SliverPrototypeExtentListPage(),
        'SliverPadding_Page':(context)=>SliverPaddingPage(),
        'SliverOpacity_Page':(context)=>SliverOpacityPage(),
        'SliverAnimatedOpacity_Page':(context)=>SliverAnimatedOpacityPage(),
        'SliverVisibility_Page':(context)=>SliverVisibilityPage(),
        'SliverFadeTransition_Page':(context)=>SliverFadeTransitionPage(),
        'SliverLayoutBuilder_Page':(context)=>SliverLayoutBuilderPage(),
        'SliverSafeArea_Page':(context)=>SliverSafeAreaPage(),
        'FlowView_Page':(context)=>FlowViewPage(),
        'NestedScrollView_Page':(context)=>NestedScrollViewPage(),
        'WillPopScope_Page':(context)=>WillPopScopePage(),
        'InheritedWidget_Page':(context)=>InheritedWidgetPage()
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            spacing: 8.0,//主轴(水平)方向间距
            runSpacing: 4.0,//纵轴方向间距
            alignment: WrapAlignment.start,//沿主轴
            children:  <Widget>[
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'text_page');
                  },
                  child: const Text('文本及样式'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'image_page');
                },
                child: const Text('图片加载'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'from_page');
                },
                child: const Text('表单'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'from_radio');
                },
                child: const Text('表单之radio实例'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'login_page');
                },
                child: const Text('登录表单实例'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'layout_page');
                },
                child: const Text('布局约束'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'row_page');
                },
                child: const Text('布局方式Row Column'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'padding_page');
                },
                child: const Text('容器类组件'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'app_page');
                },
                child: const Text('导航栏'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'bottomappbar_page');
                },
                child: const Text('BottomAppBar'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'scaffold_page');
                },
                child: const Text('Scaffold'),
              ),

              // ElevatedButton(
              //   onPressed: (){
              //     Navigator.pushNamed(context, 'indicator_page');
              //   },
              //   child: const Text('进度器'),
              // ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'dialog_page');
                },
                child: const Text('弹出框'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'border_page');
                },
                child: const Text('border'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'BoxDecoration_Page');
                },
                child: const Text('BoxDecoration'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'sv_page');
                },
                child: const Text('SingleChildScrollView'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'listview_page');
                },
                child: const Text('ListView'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'AnimatedList_page');
                },
                child: const Text('动画列表'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'gridview_page');
                },
                child: const Text('GridView网格组件'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'pageview_page');
                },
                child: const Text('PageView'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'CustomScrollView_Page');
                },
                child: const Text('CustomScrollViewPage'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverAnimatedList_page');
                },
                child: const Text(' SliverAnimatedList'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverGrid_Page');
                },
                child: const Text(' SliverGrid'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverAppBar_Page');
                },
                child: const Text('SliverAppBar'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverPersistentHeader_Page');
                },
                child: const Text('SliverPersistentHeader'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverToBoxAdapter_Page');
                },
                child: const Text('SliverToBoxAdapter'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverFillViewport_Page');
                },
                child: const Text('SliverFillViewport'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverPrototypeExtentList_Page');
                },
                child: const Text('SliverPrototypeExtentList'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverPadding_Page');
                },
                child: const Text('SliverPadding'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverOpacity_Page');
                },
                child: const Text('SliverOpacity'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverAnimatedOpacity_Page');
                },
                child: const Text('SliverAnimatedOpacity'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverVisibility_Page');
                },
                child: const Text('SliverVisibility'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverFadeTransition_Page');
                },
                child: const Text('SliverFadeTransition'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverLayoutBuilder_Page');
                },
                child: const Text('SliverLayoutBuilder'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'SliverSafeArea_Page');
                },
                child: const Text('SliverSafeArea'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'NestedScrollView_Page');
                },
                child: const Text('NestedScrollView'),
              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'WillPopScope_Page');
                },
                child: const Text('WillPopScope'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'InheritedWidget_Page');
                },
                child: const Text('InheritedWidget'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'FlowView_Page');
                },
                child: const Text('瀑布流插件'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'test_page');
                },
                child: const Text('测试页面214535634'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'test_page');
                },
                child: const Text('测试页面'),
              ),


            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

