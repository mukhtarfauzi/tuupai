import 'package:flutter/material.dart';

double screenWidth(BuildContext context, {double divideBy: 1, double reduceBy:0}){
  var size = MediaQuery.of(context).size;
  return (size.width / divideBy) - reduceBy;
}

double screenHeight(BuildContext context, {double divideBy: 1, double reduceBy:0}){
  var size = MediaQuery.of(context).size;
  return (size.height / divideBy) - reduceBy;
}