import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flare_dart/math/mat2d.dart';

class flrLoop extends FlareController{
  ActorAnimation _ac;
  String _animation;
  double _duration=0;
  double _ad;
  double _speed;

  flrLoop(animation,ad,speed){
    _animation=animation;
    _ad=ad;
    _speed=speed;
  }
  @override
  bool advance(FlutterActorArtboard artboard,double elapsed){
    _duration=_duration+(elapsed*_speed);
    _ac=artboard.getAnimation('1');

    if(_duration>=_ac.duration){
      _duration%=_ac.duration;
    }
    if(_ad+_duration>_ac.duration){
      _ac.apply(_duration+_ad-_ac.duration, artboard, 1);
      return true;
    }
    _ac.apply(_duration+_ad, artboard, 1);
    return true;
  }
  @override
  void initialize(FlutterActorArtboard artboard){
    _ac=artboard.getAnimation(_animation);
  }
  @override
  void setViewTransform(Mat2D viewTransform){

  }
}