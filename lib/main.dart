import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:saathi/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();


  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      home: Login(),

    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  static const String KEYLOGIN = "Login";
  static const String JWT_TOKEN = "token";
  static const String NAME = "name";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //navhome();

  }

  navhome() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);
    var JWT = sharedPref.getString(JWT_TOKEN);
    Timer(
      Duration(seconds: 2),
          () {
        // if (isLoggedIn != null) {
        //   if (isLoggedIn == true) {
            Get.offAll(Login());
        //   } else {
        //     //Get.offAll(Login());
        //   }
        // } else {
        //  // Get.offAll(Login());
        // }
      },
    );


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:50.0),
              child: Column(
                children: [
                 // SizedBox(width:200,height: 200,child: Image.asset('assets/Avidia.png'),),
                  //SizedBox(width:90,height: 90,child: Lottie.asset('assets/splash2.json'),),
                Text("Splash Page")
                ],
              ),
            ),
          ),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top:20.0),
          //     child: SizedBox(width:100,height: 100,child: Image.asset('assets/Noobsverse.png'),),
          //   ),
          // )
        ],
      ),
    );
  }
}


