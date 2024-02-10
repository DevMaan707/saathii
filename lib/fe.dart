import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage/homepage_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      themeMode: ThemeMode.light, // or whatever theme mode you prefer
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  static const String KEYLOGIN = "Login";
  static const String JWT_TOKEN = "token";
  static const String NAME = "name";
  static const String graphQLSTATE="graphQL";
  @override
  void initState() {
    super.initState();
    navigateHome();
  }

   navigateHome() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);
    var JWT = sharedPref.getString(JWT_TOKEN);
    Timer(
      Duration(seconds: 2),
          () {
        if (isLoggedIn != null) {
          if (isLoggedIn == true) {
            Get.offAll(HomepageWidget());
          } else {
            //Get.offAll(Login());
          }
        } else {
          // Get.offAll(Login());
        }
      },
    );

    // await Future.delayed(const Duration(milliseconds: 500),(){});
    // Get.offAllNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Page"),
      ),
    );
  }
}
