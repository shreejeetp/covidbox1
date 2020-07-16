import 'dart:ui';

import 'package:flare_flutter/flare_controls.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'flrLoop.dart';
import 'headerText.dart';
import 'homePage.dart';
import 'terms1.dart';
import 'package:firebase_auth/firebase_auth.dart';

final Color c_main=Color(0xff3a1e1e);
//final Color c_main=Color(0xff757575);

final Color c_dark=Color(0xff361919);
final Color c_accent=Color(0xff8BC34A);
final Color ct_prim=Color(0xFFFFFFff);
final Color ct_seco=Color(0xff757575);
final Color c_divi=Color(0xffBDBDBD);
final Color c_ligh=Color(0xffD1C4E9);


class login extends StatefulWidget {
  login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  loginState createState() => loginState();
}

class loginState extends State<login> with TickerProviderStateMixin {
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
  String _email;
  String _pass;

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


  @override
  Widget build(BuildContext context) {

    ht=MediaQuery.of(context).size.height;
    wt=MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: wt,
            height: ht,
            decoration: BoxDecoration(
               // image: DecorationImage(image:AssetImage("assets/images/bg3.png"),fit: BoxFit.fitHeight)
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 0.25*ht,
                  width: wt,
                  color:c_main
                  ,child: Stack(
                    children: <Widget>[
                      wCorona(context),],
                  ),
                ),
                Container(
                  height: 0.75 *ht,
                  width: wt,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 0.1*ht,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(wt*0.1, 0, wt*0.1, 0),
                        height: 0.05*ht,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            contentPadding: EdgeInsets.fromLTRB(wt*0.05, ht*0.02,wt*0.05, ht*0.02),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.01*ht)),
                          ),
                          onChanged: (input){_email=input;},
                        ),
                      ),

                      SizedBox(
                        height: 0.05 *ht,
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(wt*0.1, 0, wt*0.1, 0),
                        height: 0.05*ht,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            contentPadding: EdgeInsets.fromLTRB(wt*0.05, ht*0.02,wt*0.05, ht*0.02),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.01*ht)),
                          ),
                          onChanged: (input){this._pass=input;},
                        ),
                      ),
                      Container(
                        height: 0.05*ht,
                        child: Align(
                          alignment: Alignment.centerRight,child: Padding(
                          padding: EdgeInsets.only(right: wt*0.12),
                          child: Text("Forgot Password?",style: TextStyle(fontStyle: FontStyle.italic),),
                        ),
                        ),
                      ),

                      SizedBox(
                        height: 0.15*ht,
                      ),

                      Container(
                        height: ht*0.2,
                        child: ButtonBar(
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text('Back',style: TextStyle(color: Colors.grey),),
                            ),
                            CupertinoButton(
                              onPressed: (){
                                signIn();
                              },
                              color: c_main,
                              child: Text('Login',),

                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
   void signIn() async {
    try{
      print("pRoiasa1 1\n");
        FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _pass)).user;
        print("pRoiasa");
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => terms1()));
      }catch(e){
        print(e.message);
    }

  }
  Widget wCorona(context){
    return Stack(
      children: <Widget>[
        FlareActor(
          'assets/flare/corona.flr',
          fit: BoxFit.contain,
          animation: '1',
          controller: ctrller,
          isPaused: false,
          color: Colors.red,
          alignment: Alignment.bottomCenter,
        ),
        FlareActor(
            'assets/flare/corona.flr',
            fit: BoxFit.contain,
            animation: '1',
            controller: ctrller2,
            isPaused: false,
            alignment: Alignment.topCenter,
            color: Colors.brown
        ),
        FlareActor(
          'assets/flare/corona.flr',
          fit: BoxFit.contain,
          animation: '1',
          controller: ctrller3,
          isPaused: false,
        ),

        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
          child: Container(
            height: 0.25*ht,
            width: wt,
            decoration: BoxDecoration(
              color:Color(0xff5168FF).withOpacity(0)
            ),
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height:.15*ht,child: Center(
              child: Stack(
                children: <Widget>[
                  FadeTransition(opacity:turn==1?at:at2,child: headerText("Stay Home.","Save Lives."),),
                  FadeTransition(opacity:turn==2?at:at2,child: headerText("Keep","a safe distance."),),
                  FadeTransition(opacity:turn==3?at:at2,child: headerText("Wash","hands often."),),
                  FadeTransition(opacity:turn==4?at:at2,child: headerText("Cover","your mouth."),),
                  FadeTransition(opacity:turn==5?at:at2,child: headerText("Sick?","Call the helpline."),),
                ]
                ,
              ),
            )),
            FadeTransition(
                opacity: at,
                child: Container(height:.1*ht,child: Align(alignment:Alignment.topCenter,child: Icon(Icons.check_circle_outline,size: wt*0.15,color: Colors.white,),))),
          ],

        ),
      ],
    );
  }
}