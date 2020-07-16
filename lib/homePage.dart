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
import 'uohId.dart';
import 'customWidgets.dart';
//Colors
final Color c_main=Color(0xff3a1e1e);
final Color c_dark=Color(0xff361919);
final Color c_accent=Color(0xff8BC34A);
final Color ct_prim=Color(0xFFFFFFff);
final Color ct_seco=Color(0xff757575);
final Color c_divi=Color(0xffBDBDBD);
final Color c_ligh=Color(0xffD1C4E9);


class homePage extends StatefulWidget{
  homePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  homePageState createState() => homePageState();
}

// ignore: camel_case_types
class homePageState extends State<homePage>{
  double ht;
  double wt;
  final GlobalKey<ScaffoldState> _scfldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context){
    ht=MediaQuery.of(context).size.height;
    wt=MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scfldKey,
      drawer: cstmDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 0.25*ht,
              width: wt,
              child: Card(
                child: InkWell(
                  splashColor: c_divi,
                  onTap: (){
                    _scfldKey.currentState.openDrawer();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: ht*.1),
                    child: ListTile(
                      leading: Container(
                        width: wt*0.25,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.menu),
                            SizedBox(
                              width: wt*0.08,
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/user.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(left: wt*0.01),
                        child: Text('Shreejeet Praveen'),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(left: wt*0.01),
                        child: Text('19MCMB16'),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: ht*0.03,
            ),
            Container(
              height: .72*ht,
              width: wt,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left:wt*0.033),
                        child: tileWidget("assets/images/barcode.png", "assets/images/bar.png", "Bar Code",Colors.deepOrange,0.45),
                      ),
                      SizedBox(
                        width: 0.033*wt,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right:wt*0.033),
                        child: tileWidget("assets/images/id.png", "assets/images/clgid.jpg", "I.D.",Colors.indigo,0.45),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.2,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.02*wt,vertical: 0.03*ht),
                    child: icntileWidget(Icons.check_circle, Icons.assignment_turned_in, "You are Safe!",Colors.green,0.9),
                  ),
                  //uohId('Shreejeet Praveen','19MCMB16','School of Computer and Information Sciences',"M.Tech IT",'II'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}