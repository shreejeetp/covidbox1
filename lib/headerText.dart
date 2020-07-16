
import 'package:flutter/cupertino.dart';

final Color c_main=Color(0xff3a1e1e);
final Color c_dark=Color(0xff361919);
final Color c_accent=Color(0xff8BC34A);
final Color ct_prim=Color(0xFFFFFFff);
final Color ct_seco=Color(0xff757575);
final Color c_divi=Color(0xffBDBDBD);
final Color c_ligh=Color(0xffD1C4E9);


class headerText extends StatelessWidget{
  String firstLine;
  String secondLine;

  headerText(firstLine,secondLine){
    this.firstLine=firstLine;
    this.secondLine=secondLine;

  }
  double ht;
  double wt;
  @override
  Widget build(BuildContext context) {
    ht=MediaQuery.of(context).size.height;
    wt=MediaQuery.of(context).size.width;

    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: .15 * ht,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 0.05*ht,
              ),
              Text(
                firstLine,
                style: TextStyle(color: ct_prim,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'krona-one',),
              ),
              Text(
                secondLine,
                style: TextStyle(color: ct_prim,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'krona-one',),
              ),

            ],
          ),
        )
    );
  }

}