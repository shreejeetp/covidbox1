import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customWidgets.dart';
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'flrLoop.dart';
import 'headerText.dart';
import 'homePage.dart';
import 'login.dart';
import 'package:google_fonts/google_fonts.dart';

final Color c_main=Color(0xff3a1e1e);
//final Color c_main=Color(0xff757575);

final Color c_dark=Color(0xff361919);
final Color c_accent=Color(0xff8BC34A);
final Color ct_prim=Color(0xFFFFFFff);
final Color ct_seco=Color(0xff757575);
final Color c_divi=Color(0xffBDBDBD);
final Color c_ligh=Color(0xffD1C4E9);


class intro extends StatefulWidget {
  intro({Key key, this.title}) : super(key: key);
  final String title;

  @override
  introState createState() => introState();
}

class introState extends State<intro> with TickerProviderStateMixin {

  final flrLoop ctrller=flrLoop('1',0.0,1.0);
  final flrLoop ctrller2=flrLoop('1',1.0,1.2);
  final flrLoop ctrller3=flrLoop('1',2.0,2.0);
  double ht;
  double wt;
  String _an='1';
  AnimationController ac;
  Animation<double> at;
  Animation<double> at2;
  int turn=1;
  int maxturn=5;
  Timer t;


  @override
  void initState(){

    super.initState();

    ac=AnimationController(vsync: this,duration: Duration(seconds: 1));
    at=Tween<double>(begin:0,end: 1).animate(CurvedAnimation(parent: ac,curve: Curves.easeIn,reverseCurve: Curves.easeOut));
    at2=Tween<double>(begin:0,end: 0).animate(ac);

    ac.forward();

    t=Timer.periodic(Duration(seconds: 5), (_){
      turn=turn==maxturn?1:turn+1;
      ac.reverse();
      Future.delayed(Duration(seconds: 2),(){
        setState(() {
          ac.forward();
        });});

    });
  }

  @override
  void dispose()
  {
    ac.dispose();
    t.cancel();
    super.dispose();
  }


  Widget build(BuildContext context){
    wt=MediaQuery.of(context).size.width;
    ht=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: wt,
            height: ht,
            decoration: BoxDecoration(
              color: c_main,
              image: DecorationImage(image:AssetImage("assets/images/bg5.png"),fit: BoxFit.fill)
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:0.25*ht),
            child: Container(
                width: wt,
                height: ht*.75,
                decoration: BoxDecoration(
                  //image: DecorationImage(image:AssetImage("assets/images/bg3.png"),fit: BoxFit.fill)
                ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 0.5*ht,),
              Container(
                padding: EdgeInsets.only(left:wt*0.05),
                  height: ht*0.1,
                  width: wt,
                  child: headingText("Sign-In!",Colors.black)
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:0.1*wt),
                child: Divider(
                  thickness: 0.001*ht,
                ),
              ),
              SizedBox(
                height: 0.05*ht,
              ),

              InkWell(
                  splashColor: Colors.deepPurple,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                  },
                  child: longButton("FACULTY/STUDENT")),

              SizedBox(
                height: ht*0.04,
              ),

              longButton("OTHERS"),

              SizedBox(height: 0.1*ht,),
            ],
          ),
        ],
      ),
    );
  }


}