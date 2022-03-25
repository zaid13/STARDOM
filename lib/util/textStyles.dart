

import "package:flutter/material.dart";



sofiaStyle({@required Color color=Colors.white,@required int fontSize=18,@required bool bold=false }){
  return TextStyle(
    color: color,
    fontSize: fontSize.toDouble(),
    fontFamily: "Sofia Pro",
    fontWeight: bold==false?FontWeight.w400:FontWeight.w800
  );
}



ubuntuStyle({@required Color color=Colors.white,@required int fontSize=18,@required bool bold=false }){
  return TextStyle(
      color: color,
      fontSize: fontSize.toDouble(),
      fontFamily: "Ubuntu",
      fontWeight: bold==false?FontWeight.w400:FontWeight.w900
  );
}