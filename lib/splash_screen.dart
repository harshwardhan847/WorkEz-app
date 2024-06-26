import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:web2app/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getScreenByAuth() async {
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ));
  }

  //runs first while loading screen
  @override
  void initState() {
    super.initState();
    //to remove top and bottom bars while splash screen is shown
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    getScreenByAuth();
  }

  //cleanup function
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: const Text('Flutter Demo Home Page'),
      // ),
      body: Center(
        child: Image.asset(
          'assets/images/splashLogo.png',
        ),
      ),
    );
  }
}
