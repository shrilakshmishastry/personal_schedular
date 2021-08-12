import 'package:flutter/material.dart';

Size getSize(BuildContext context){
  return MediaQuery.of(context).size;
}

double getHeight(BuildContext context){
  return getSize(context).height;
}

double getWidth(BuildContext context){
  return getSize(context).width;
}

double setWidth(BuildContext context){
  double widthAct = getWidth(context);
  double heightAct = getHeight(context);
  double width = widthAct > heightAct ? heightAct : widthAct;
  return width;
}

double setHeight(BuildContext context){
  double widthAct = getWidth(context);
  double heightAct = getHeight(context);
  double height   =  widthAct > heightAct ? widthAct : heightAct;
  return height;
}

