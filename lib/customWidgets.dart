
import 'dart:typed_data';

import 'package:flare_flutter/flare_controls.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/rendering.dart';
import 'flrLoop.dart';
import 'login.dart';
import 'uohId.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flare_flutter/flare_controls.dart';

//Colors
final Color c_main=Color(0xff3a1e1e);
final Color c_dark=Color(0xff361919);
final Color c_accent=Color(0xff8BC34A);
final Color ct_prim=Color(0xFFFFFFff);
final Color ct_seco=Color(0xff757575);
final Color c_divi=Color(0xffBDBDBD);
final Color c_ligh=Color(0xffD1C4E9);
double ht;
double wt;



class cstmDrawer extends StatelessWidget{

  Widget build(BuildContext context){
    ht=MediaQuery.of(context).size.height;
    wt=MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: 0.75 *wt,
      child: Column(
        children: <Widget>[
          Container(
            height: 0.25*ht,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/mountain.png"),fit: BoxFit.fill)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: ht*0.05,
                ),
                Container(
                  padding: EdgeInsets.only(left:0.04*wt),
                  height: 0.08*ht,
                  width: wt,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                        backgroundImage:AssetImage("assets/images/user.png")
                    ),
                  ),
                ),

                SizedBox(
                  height: 0.04*ht,
                ),

                Container(
                    padding: EdgeInsets.only(left: 0.04*wt),
                    alignment: Alignment.centerLeft,
                    child: Text("Shreejeet Praveen",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),)
                ),

                Container(
                    padding: EdgeInsets.only(left: 0.04*wt),
                    alignment: Alignment.centerLeft,
                    child: Text("Student",style: TextStyle(color: Colors.tealAccent,),)
                )
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: InkWell(
              splashColor: c_divi,
              onTap: (){},
              child: ListTile(
               leading: Icon(Icons.home,size: 0.04*ht,),
               title: Text("Home"),
              ),
            ),
          ),

          Card(
            elevation: 0,
            child:InkWell(
            splashColor: c_main,
            onTap: (){},
            child: ListTile(
              leading: Icon(Icons.call,size: 0.04*ht,),
              title: Text("Need Help?"),
            ),
          ),
          ),

          Card(
            elevation: 0,
            child:InkWell(
              splashColor: c_main,
              onTap: (){},
              child: ListTile(
                leading: Icon(Icons.announcement,size: 0.04*ht,),
                title: Text("About"),
              ),
            ),
          )

        ],
      ),
    );
  }
}


class headingText extends StatelessWidget{
  String heading;
  Color color;
  headingText(String heading,Color color){
    this.heading=heading;
    this.color=color;
  }
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AutoSizeText(heading,style: TextStyle(color: color,fontSize: 100,fontFamily: 'Segoe-UI'),),
    );
  }
}

class longButton extends StatelessWidget{
  String st;
  longButton(String st){
    this.st=st;
}
  Widget build(BuildContext context){
    double wt=MediaQuery.of(context).size.width;
    double ht=MediaQuery.of(context).size.height;

  return Padding(
    padding:EdgeInsets.symmetric(horizontal:wt*.05),
    child: Container(
      height: 0.07*ht,
      width: wt*0.9,
      decoration: BoxDecoration(
        color: c_main,
        borderRadius: BorderRadius.all(Radius.circular(wt*0.03))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.1*wt,vertical: 0.02*ht),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(st,style: GoogleFonts.workSans(textStyle:TextStyle(color: Colors.white,fontSize: 100),))
            ,
          ],
        ),
      ),
    ),
    );
}
}

class tileWidget extends StatelessWidget{
  String imageN;
  String popN;
  String text1;
  Color tileClr;
  double tilewt;

  tileWidget(String imageN,String popN,String text1,Color tileClr,double tilewt){
    this.imageN=imageN;
    this.popN=popN;
    this.text1=text1;
    this.tileClr=tileClr;
    this.tilewt=tilewt;
  }
  Widget build(BuildContext context){
    ht=MediaQuery.of(context).size.height;
    wt=MediaQuery.of(context).size.width;
    return InkWell(
    splashColor: c_main,
    onTap: (){
      nobtnDialog._showDialog(context,popN);
      },
    child: Container(
    height: 0.2*ht,
    width: wt*tilewt,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(0.02*ht)),
    color: tileClr,
    boxShadow: [BoxShadow(
    color: Colors.black,
    blurRadius: 1.0,)]
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Center(
    child: Container(
    height: ht*.1,
    width: wt*tilewt,
    child: FittedBox(
    fit: BoxFit.contain,
    child: Image(image: AssetImage(imageN)),
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.only(left:wt*tilewt*0.1,right: wt*tilewt*0.1,top: ht*0.01,bottom: ht*0.01),
    child: Divider(
    thickness: 1,
    color: Colors.white,
    ),
    ),
    Text(text1,style: TextStyle(color: Colors.white),)
    ],
    ),
    ),
    );
}
}


class icntileWidget extends StatelessWidget{
  IconData iconN;
  IconData popN;
  String text1;
  Color tileClr;
  double tilewt;

  icntileWidget(IconData iconN,IconData popN,String text1,Color tileClr,double tilewt){
    this.iconN=iconN;
    this.popN=popN;
    this.text1=text1;
    this.tileClr=tileClr;
    this.tilewt=tilewt;
  }
  Widget build(BuildContext context){
    ht=MediaQuery.of(context).size.height;
    wt=MediaQuery.of(context).size.width;
    return InkWell(
      splashColor: c_main,
      onTap: (){
      },
      child: Container(
        height: 0.2*ht,
        width: wt*tilewt,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0.02*ht)),
            color: tileClr,
            boxShadow: [BoxShadow(
              color: Colors.black,
              blurRadius: 1.0,)]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: ht*.1,
                width: wt*tilewt,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(iconN,color: Colors.white,),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:wt*tilewt*0.1,right: wt*tilewt*0.1,top: ht*0.01,bottom: ht*0.01),
              child: Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
            Text(text1,style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}


class nobtnDialog{
  static void _showDialog(context,imageName) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  height:0.25*ht,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image(
                      image: AssetImage(imageName),
                    ),
                  ),
                )
              ],
            ),
          ),

        );
      },
    );
  }
}