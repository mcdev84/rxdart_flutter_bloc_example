//Costom CLipper class with Path
import 'package:flutter/cupertino.dart';
import 'package:rx_dart/constants/layout/sizes.dart';

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_1 = Path();
    path_1.moveTo(size.width*0.5041100,size.height*0.0159600);
    path_1.cubicTo(size.width*0.6817030,size.height*0.0159600,size.width*0.9481233,size.height*0.1283600,size.width*0.9481233,size.height*0.4174200);
    path_1.cubicTo(size.width*0.9481233,size.height*0.5780000,size.width*0.8149028,size.height*0.8188800,size.width*0.5041100,size.height*0.8188800);
    path_1.cubicTo(size.width*0.3502085,size.height*0.6617400,size.width*0.0600968,size.height*0.6984400,size.width*0.0600968,size.height*0.4174200);
    path_1.cubicTo(size.width*0.0600968,size.height*0.2568400,size.width*0.2908253,size.height*0.1756400,size.width*0.5041100,size.height*0.0159600);
    path_1.close();
    return path_1;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
