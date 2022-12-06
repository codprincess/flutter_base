import 'package:flutter/material.dart';
import 'package:flutter_base/AnimatedBuilderPage.dart';
import 'package:flutter_base/AnimatedListPage.dart';
import 'package:flutter_base/AnimatedModalBarrierPage.dart';
import 'package:flutter_base/AppPage.dart';
import 'package:flutter_base/BorderPage.dart';
import 'package:flutter_base/BottomAppBarPage.dart';
import 'package:flutter_base/BoxDecorationPage.dart';
import 'package:flutter_base/CurvePage.dart';
import 'package:flutter_base/DatePickerPage3.dart';
import 'package:flutter_base/FromPage.dart';
import 'package:flutter_base/FromRadio.dart';
import 'package:flutter_base/GestureDetectorPage.dart';
import 'package:flutter_base/GridViewPage.dart';
import 'package:flutter_base/ImagePage.dart';
import 'package:flutter_base/IndicatorPage.dart';
import 'package:flutter_base/LayoutPage.dart';
import 'package:flutter_base/ListViewPage.dart';
import 'package:flutter_base/ListenerPage.dart';
import 'package:flutter_base/LoginPage.dart';
import 'package:flutter_base/NestedScrollViewPage.dart';
import 'package:flutter_base/PaddingPage.dart';
import 'package:flutter_base/PageViewPage.dart';
import 'package:flutter_base/RowPage.dart';
import 'package:flutter_base/ScaffoldPage.dart';
import 'package:flutter_base/ScaleAnimationPage.dart';
import 'package:flutter_base/SliverAnimatedListPage.dart';
import 'package:flutter_base/SliverAnimatedOpacityPage.dart';
import 'package:flutter_base/SliverFadeTransitionPage.dart';
import 'package:flutter_base/SliverLayoutBuilderPage.dart';
import 'package:flutter_base/SliverPaddingPage.dart';
import 'package:flutter_base/SliverPersistentHeaderPage.dart';
import 'package:flutter_base/SliverSafeAreaPage.dart';
import 'package:flutter_base/SliverToBoxAdapterPage.dart';
import 'package:flutter_base/SnackBarPage.dart';
import 'package:flutter_base/SvPage.dart';
import 'package:flutter_base/TestPage.dart';
import 'package:flutter_base/TextPage.dart';
import 'package:flutter_base/SliverOpacityPage.dart';
import 'package:flutter_base/ThemePage.dart';
import 'package:flutter_base/TweenPage.dart';
import 'package:flutter_base/WillPopScopePage.dart';
import 'package:flutter_base/dark_theme_styles.dart';
import 'package:flutter_base/model/DarkModeProvider.dart';
import 'package:flutter_base/model/DarkThemeProvider.dart';
import 'package:flutter_base/model/ThemeStore.dart';
import 'package:flutter_base/pages/StackPage.dart';
import 'package:flutter_base/showBottomSheetPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AlignTransitionPage.dart';
import 'AnimatedWidgetPage.dart';
import 'AnimationPage.dart';
import 'CurvedAnimationPage.dart';
import 'CustomScrollViewPage.dart';
import 'DatePickerPage.dart';
import 'DatePickerPage2.dart';
import 'FlowViewPage.dart';
import 'FutureBuilderPage.dart';
import 'GestureRecognizerPage.dart';
import 'InheritedWidgetPage.dart';
import 'OffstagePage.dart';
import 'PositionedPage.dart';
import 'ProviderPage.dart';
import 'RoutePage.dart';
import 'SliverAppBarPage.dart';
import 'SliverFillViewportPage.dart';
import 'SliverGridPage.dart';
import 'SliverPrototypeExtentListPage.dart';
import 'SliverVisibilityPage.dart';
import 'StreamBuilderPage.dart';
import 'VisibilityPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:convert';
void main() {
  SharedPreferences.setMockInitialValues({});
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  @override
  void initState() {
    // TODO: implement initState
    // 初始化ThemeStore，之后赋值到themeProvider中
    getCurrentAppTheme();
    super.initState();
  }
  void getCurrentAppTheme() async{
    themeChangeProvider.darkTheme = await themeChangeProvider.darkThemePreference.getTheme();
  }
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>themeChangeProvider)
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context,darkModeProvider,child){
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('zh','CH'),
              Locale('en','US')
            ],
            title: 'Flutter Demo',
            // theme: ThemeData(colorScheme: const ColorScheme.light()), // 亮色主题
            // darkTheme: ThemeData(colorScheme: const ColorScheme.dark()), // 暗色主题
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),

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
              'SnackBar_page':(context)=>SnackBarPage(),
              'border_page':(context)=>BorderPage(),
              'stack_page':(context)=>StackPage(),
              'Positioned_Page':(context)=>PositionedPage(),
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
              'InheritedWidget_Page':(context)=>InheritedWidgetPage(),
              'Provider_Page':(context)=>ProviderPage(),
              'theme_page':(context)=>ThemePage(),
              'FutureBuilder_Page':(context)=>FutureBuilderPage(),
              'StreamBuilder_Page':(context)=>StreamBuilderPage(),
              'Visibility_Page':(context)=>VisibilityPage(),
              'Offstage_Page':(context)=>OffstagePage(),
              'DatePicker_Page':(context)=>DatePickerPage(),
              'DatePicker_Page2':(context)=>DatePickerPage2(),
              'DatePicker_Page3':(context)=>DatePickerPage3(),
              'Listener_page':(context)=>ListenerPage(),
              'GestureDetector_page':(context)=>GestureDetectorPage(),
              'GestureRecognizer_Page':(context)=>GestureRecognizerPage(),
              'Animation_Page':(context)=>AnimationPage(),
              'Curve_page':(context)=>CurvePage(),
              'CurvedAnimation_Page':(context)=>CurvedAnimationPage(),
              'Tween_page':(context)=>TweenPage(),
              'ScaleAnimation_page':(context)=>ScaleAnimationPage(),
              'AnimatedWidget_Page':(context)=>AnimatedWidgetPage(),
              'AnimatedBuilder_Page':(context)=>AnimatedBuilderPage(),
              'AlignTransition_Page':(context)=>AlignTransitionPage(),
              'AnimatedModalBarrier_Page':(context)=>AnimatedModalBarrierPage(),

            },
          );
        },
      ),
    );

  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title,}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title:
      Text(widget.title),
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const PageScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left:20.0,right: 0),
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
                      Navigator.pushNamed(context, 'theme_page');
                    },
                    child: const Text('Theme 主题'),
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
                      Navigator.pushNamed(context, 'Visibility_Page');
                    },
                    child: const Text('Visibility'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Offstage_Page');
                    },
                    child: const Text('Offstage'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'DatePicker_Page');
                    },
                    child: const Text('日期选择器ios风格'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'DatePicker_Page2');
                    },
                    child: const Text('日期选择器Material风格'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'DatePicker_Page3');
                    },
                    child: const Text('showDateRangePicker'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'dialog_page');
                    },
                    child: const Text('弹出框'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'SnackBar_page');
                    },
                    child: const Text('SnackBar'),
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
                      Navigator.pushNamed(context, 'stack_page');
                    },
                    child: const Text('Stack'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Positioned_Page');
                    },
                    child: const Text('Positioned'),
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
                      Navigator.pushNamed(context, 'Provider');
                    },
                    child: const Text('Provider'),
                  ),
                  //数据加载

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'FutureBuilder_Page');
                    },
                    child: const Text('FutureBuilder'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'StreamBuilder_Page');
                    },
                    child: const Text('StreamBuilder'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Listener_page');
                    },
                    child: const Text('Listener'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'GestureDetector_page');
                    },
                    child: const Text('GestureDetector'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'GestureRecognizer_Page');
                    },
                    child: const Text('GestureRecognizer'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Animation_Page');
                    },
                    child: const Text('Animation'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'CurvedAnimation_Page');
                    },
                    child: const Text('CurvedAnimation'),
                  ),


                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Curve_page');
                    },
                    child: const Text('Curve'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Tween_page');
                    },
                    child: const Text('Tween'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'ScaleAnimation_page');
                    },
                    child: const Text('图片放大效果'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'AnimatedWidget_Page');
                    },
                    child: const Text('AnimatedWidget'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'AnimatedBuilder_Page');
                    },
                    child: const Text('AnimatedBuilder'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'AlignTransition_Page');
                    },
                    child: const Text('AlignTransition'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'AnimatedModalBarrier_Page');
                    },
                    child: const Text('AnimatedModalBarrier'),
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
          Positioned(
              right:0,
              top: 0,
              child: GestureDetector(
                onTap: (){
                  themeProvider.darkTheme = !themeProvider.darkTheme;
                },
                child: Container(
                  height:150,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                    ),
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).hoverColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,bottom: 28),
                    child:themeProvider.darkTheme
                        ? Image.asset('images/bulb_off.png',fit: BoxFit.fitHeight,)
                        : Image.asset('images/bulb_on.png',fit: BoxFit.fitHeight,)
                  ),
                ),
              )
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

