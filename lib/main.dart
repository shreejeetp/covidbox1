import 'dart:ui';

import 'package:flare_flutter/flare_controls.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'flrLoop.dart';
import 'login.dart';
import 'intro.dart';
import 'package:flutter/services.dart';
//Colors
final Color c_main=Color(0xff3a1e1e);
final Color c_dark=Color(0xff361919);
final Color c_accent=Color(0xff8BC34A);
final Color ct_prim=Color(0xFFFFFFff);
final Color ct_seco=Color(0xff757575);
final Color c_divi=Color(0xffBDBDBD);
final Color c_ligh=Color(0xffD1C4E9);

//Images
final Image iCorona=Image(image:AssetImage("assets/images/corona_i_small.png"));

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness:Brightness.light,
      ),
      home: SplashScreen.navigate(
        name: 'assets/flare/intro.flr',
        next: (_) =>intro(title: 'CovidBox'),
        until: () => Future.delayed(Duration(seconds: 4)),
        startAnimation: '1',
        backgroundColor: Color(0xff3a1e1e),
      )
    );
  }
}



