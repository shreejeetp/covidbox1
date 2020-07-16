import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class uohId extends StatelessWidget{
  double ht;
  double wt;
  String name, roll, dept, sub, sem;

  uohId(name, roll, dept, sub,sem){
    this.name=name;
    this.roll=roll;
    this.dept=dept;
    this.sub=sub;
    this.sem=sem;
  }


  @override
  Widget build(BuildContext context){
    ht=MediaQuery.of(context).size.height;
    wt=MediaQuery.of(context).size.width;
    return Container(
      height: 0.5*ht,
      width: wt,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(0.02*ht)) ,
        boxShadow: [BoxShadow(
          color: Colors.black,
          blurRadius: 2,
        )],
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 0.1*ht,
            width: wt,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Image(image: AssetImage("assets/images/uoh.png"),),
            ),
          ),
          ListTile(
            leading: Text("Name"),
            title: Text(name),
          ),
          ListTile(
            leading: Text("College ID"),
            title: Text(roll),
          ),
          ListTile(
            leading: Text(sub),
            title: Text(sem),
          ),
          ListTile(
            title: Text(dept),
          ),

        ],
      ),
    );
  }
}