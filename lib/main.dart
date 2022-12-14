import 'package:flutter/material.dart';
import 'package:flutter_base/AnimatedAlignPage.dart';
import 'package:flutter_base/AnimatedBuilderPage.dart';
import 'package:flutter_base/AnimatedContainerPage.dart';
import 'package:flutter_base/AnimatedCrossFadePage.dart';
import 'package:flutter_base/AnimatedListPage.dart';
import 'package:flutter_base/AnimatedModalBarrierPage.dart';
import 'package:flutter_base/AnimatedOpacityPage.dart';
import 'package:flutter_base/AnimatedSwitcherPage.dart';
import 'package:flutter_base/AppPage.dart';
import 'package:flutter_base/BorderPage.dart';
import 'package:flutter_base/BottomAppBarPage.dart';
import 'package:flutter_base/DecoratedBoxTransitionPage.dart';
import 'package:flutter_base/DefaultTextStyleTransitionPage.dart';
import 'package:flutter_base/HeroPage.dart';
import 'package:flutter_base/InkWellPage.dart';
import 'package:flutter_base/ModalBarrierPage.dart';
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
import 'package:flutter_base/PositionedTransitionPage.dart';
import 'package:flutter_base/RelativePositionedTransitionPage.dart';
import 'package:flutter_base/RotatedBoxPage.dart';
import 'package:flutter_base/RowPage.dart';
import 'package:flutter_base/ScaffoldPage.dart';
import 'package:flutter_base/ScaleAnimationPage.dart';
import 'package:flutter_base/ScaleTransitionPage.dart';
import 'package:flutter_base/SequencePage.dart';
import 'package:flutter_base/SlideTransitionPage.dart';
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
import 'package:flutter_base/TweenAnimationBuilderPage.dart';
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
import 'CustomCheckboxPage.dart';
import 'CustomPaintPage.dart';
import 'CustomScrollViewPage.dart';
import 'DatePickerPage.dart';
import 'DatePickerPage2.dart';
import 'FlowViewPage.dart';
import 'FutureBuilderPage.dart';
import 'GestureRecognizerPage.dart';
import 'GradientButtonPage.dart';
import 'GradientCircularPage.dart';
import 'InheritedWidgetPage.dart';
import 'MatPage.dart';
import 'OffstagePage.dart';
import 'PositionedPage.dart';
import 'ProviderPage.dart';
import 'RotationTransitionPage.dart';
import 'RoutePage.dart';
import 'SizeTransitionPage.dart';
import 'SliverAppBarPage.dart';
import 'SliverFillViewportPage.dart';
import 'SliverGridPage.dart';
import 'SliverPrototypeExtentListPage.dart';
import 'SliverVisibilityPage.dart';
import 'StreamBuilderPage.dart';
import 'TransformPage.dart';
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
    // ?????????ThemeStore??????????????????themeProvider???
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
            // theme: ThemeData(colorScheme: const ColorScheme.light()), // ????????????
            // darkTheme: ThemeData(colorScheme: const ColorScheme.dark()), // ????????????
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),

            initialRoute: '/',//??????"/"????????????????????????home(??????)
            //????????????
            routes: {
              '/':(context)=> MyHomePage(title: '??????????????????'),//??????????????????
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
              'ModalBarrier_page':(context)=> ModalBarrierPage(),
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
              'DecoratedBoxTransition_Page':(context) => DecoratedBoxTransitionPage(),
              'DefaultTextStyleTransition_page':(context) => DefaultTextStyleTransitionPage(),
              'PositionedTransition_page':(context) => PositionedTransitionPage(),
              'RelativePositionedTransition_page':(context)=>RelativePositionedTransitionPage(),
              'RotationTransition_Page':(context) => RotationTransitionPage(),
              'ScaleTransition_Page':(context) => ScaleTransitionPage(),
              'SizeTransition_Page':(context) =>SizeTransitionPage(),
              'SlideTransition_Page':(context) => SlideTransitionPage(),
              'AnimatedContainer_Page':(context) =>AnimatedContainerPage(),
              'AnimatedAlign_Page':(context) => AnimatedAlignPage(),
              'AnimatedOpacity_Page':(context) => AnimatedOpacityPage(),
              'AnimatedCrossFade_Page':(context) =>AnimatedCrossFadePage(),
              'Hero_Page':(context) => HeroPage(),
              'Sequence_Page':(context) => SequencePage(),
              'AnimatedSwitcher_Page':(context) => AnimatedSwitcherPage(),
              'Transform_Page':(context) => TransformPage(),
              'Matrix4_Page':(context) => Matrix4Page(),
              'TweenAnimationBuilder_Page':(context) => TweenAnimationBuilderPage(),
              'GradientButton_Page':(context) => GradientButtonPage(),
              'InkWell_Page':(context) => InkWellPage(),
              'CustomPaint_Page':(context) => CustomPaintPage(),
              'GradientCircular_Page':(context) => GradientCircularPage(),
              'RotatedBox_Page':(context) => RotatedBoxPage(),
              'CustomCheckbox_Page':(context) => CustomCheckboxPage(),
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
                spacing: 8.0,//??????(??????)????????????
                runSpacing: 4.0,//??????????????????
                alignment: WrapAlignment.start,//?????????
                children:  <Widget>[
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'text_page');
                    },
                    child: const Text('???????????????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'image_page');
                    },
                    child: const Text('????????????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'from_page');
                    },
                    child: const Text('??????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'from_radio');
                    },
                    child: const Text('?????????radio??????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'login_page');
                    },
                    child: const Text('??????????????????'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'layout_page');
                    },
                    child: const Text('????????????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'theme_page');
                    },
                    child: const Text('Theme ??????'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'row_page');
                    },
                    child: const Text('????????????Row Column'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'padding_page');
                    },
                    child: const Text('???????????????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'app_page');
                    },
                    child: const Text('?????????'),
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
                  //   child: const Text('?????????'),
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
                    child: const Text('???????????????ios??????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'DatePicker_Page2');
                    },
                    child: const Text('???????????????Material??????'),
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
                    child: const Text('?????????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'ModalBarrier_page');
                    },
                    child: const Text('ModalBarrier'),
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
                      Navigator.pushNamed(context, 'InkWell_Page');
                    },
                    child: const Text('InkWell'),
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
                    child: const Text('????????????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'gridview_page');
                    },
                    child: const Text('GridView????????????'),
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
                  //????????????

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
                      Navigator.pushNamed(context, 'TweenAnimationBuilder_Page');
                    },
                    child: const Text('TweenAnimationBuilder'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Transform_Page');
                    },
                    child: const Text('Transform'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'RotatedBox_Page');
                    },
                    child: const Text('RotatedBox'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'CustomCheckbox_Page');
                    },
                    child: const Text('CustomCheckboxPage'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'ScaleAnimation_page');
                    },
                    child: const Text('??????????????????'),
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
                      Navigator.pushNamed(context, 'DecoratedBoxTransition_Page');
                    },
                    child: const Text('DecoratedBoxTransition'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'DefaultTextStyleTransition_page');
                    },
                    child: const Text('DefaultTextStyleTransition'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'PositionedTransition_page');
                    },
                    child: const Text('PositionedTransition'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'RelativePositionedTransition_page');
                    },
                    child: const Text('RelativePositionedTransition'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'RotationTransition_Page');
                    },
                    child: const Text('RotationTransition'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'ScaleTransition_Page');
                    },
                    child: const Text('ScaleTransition'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'SizeTransition_Page');
                    },
                    child: const Text('SizeTransition'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'SlideTransition_Page');
                    },
                    child: const Text('SlideTransition'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'AnimatedContainer_Page');
                    },
                    child: const Text('AnimatedContainer'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'AnimatedAlign_Page');
                    },
                    child: const Text('AnimatedAlign'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'AnimatedOpacity_Page');
                    },
                    child: const Text('AnimatedOpacity'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'AnimatedCrossFade_Page');
                    },
                    child: const Text('AnimatedCrossFade'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Hero_Page');
                    },
                    child: const Text('Hero??????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Sequence_Page');
                    },
                    child: const Text('??????/????????????'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'CustomPaint_Page');
                    },
                    child: const Text('???????????????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'AnimatedSwitcher_Page');
                    },
                    child: const Text('AnimatedSwitcher'),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'Matrix4_Page');
                    },
                    child: const Text('Matrix4'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'GradientCircular_Page');
                    },
                    child: const Text('GradientCircular'),
                  ),




                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'FlowView_Page');
                    },
                    child: const Text('???????????????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'GradientButton_Page');
                    },
                    child: const Text('?????????????????????'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'test_page');
                    },
                    child: const Text('????????????'),
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

