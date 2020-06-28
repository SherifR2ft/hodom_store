import 'package:flutter/material.dart';

class ModifiedCountainer extends StatelessWidget {
  ModifiedCountainer({@required this.color, this.childCard,this.onTapAction});
  final Color color;
  final Widget childCard;
  final Function onTapAction ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // can't use setState here case it StateLessWidget at this file
        onTapAction() ;
      },
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
