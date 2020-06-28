import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    this.color,
    this.child,
    @required this.onPressed,
    this.borderColor,
    this.borderRadius,
  });
  Color color;
  Widget child;
  Function onPressed;
  Color borderColor;
  double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        child: FlatButton(
          onPressed: onPressed,
//          minWidth: 200.0,
//          height: 45.0,
          child: child,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
              side: BorderSide(color: borderColor ?? Colors.white)),
        ),
      ),
    );
  }
}
