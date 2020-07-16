import 'dart:ui';

import 'dart:async';
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

final String loc="This app monitors the places you visit privately, and saves them on secure servers.";
final String loc2="So that in case of Covid-19 emergency, contaminated zones can be easily identified";
class terms1 extends StatefulWidget {
  terms1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  terms1State createState() => terms1State();
}

class terms1State extends State<terms1> with TickerProviderStateMixin {
  Widget build(BuildContext context){
    double wt=MediaQuery.of(context).size.width;
    double ht=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: ht*0.05,
              ),
              Padding(
                padding:  EdgeInsets.only(left:wt*0.03),
                child: Align(alignment:Alignment.centerLeft,child: Icon(CupertinoIcons.location_solid,color: Colors.deepOrange,size: wt*0.15,)),
              ),
              SizedBox(
                height: ht*0.1,
              ),
              Container(
                  height: 0.1*ht,
                  width: wt*.8,
                  child: AutoSizeText(loc,style: TextStyle(fontSize: 100,fontWeight: FontWeight.w300),)
              ),
              SizedBox(
                height: ht*0.03,
              ),
              Container(
                  height: 0.1*ht,
                  width: wt*.8,
                  child: AutoSizeText(loc2,style: TextStyle(fontSize: 100,fontWeight: FontWeight.w300),)
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                  splashColor: Colors.deepPurple,
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));
                  },
                  child: longButton("Proceed")
              ),
              SizedBox(height: 0.1*ht,)
            ],
          )
        ],
      ),
    );
  }
}