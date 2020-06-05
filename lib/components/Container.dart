import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyContainer extends StatelessWidget {
  MyContainer({this.child, this.color, this.padding, this.width, this.height});

  final Widget child;
  final Color color;
  final EdgeInsets padding;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? null : width,
      height: height == null ? null : height,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            offset: Offset(0.0, 2.0),
            blurRadius: 10.0,
            spreadRadius: 1.0
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
        color: color == null ? Colors.white : color,
      ),
      child: child,
    );
  }
}