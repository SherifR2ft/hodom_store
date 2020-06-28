import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class SetCarousel extends StatefulWidget {
  SetCarousel(this.images);
  List<dynamic> images ;
  @override
  _SetCarouselState createState() => _SetCarouselState();
}

class _SetCarouselState extends State<SetCarousel> {
  final double borderRadius = 10.0 ;
  final String defaultImagePath = "assets/Advertising.jpg" ;
  List<dynamic> images ;
  @override
  void initState() {

    images= widget.images ;

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150.0,
        child: Material(
          color: Colors.transparent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Carousel(
            borderRadius: true,
              indicatorBgPadding : 15.0,

            defaultImage: ExactAssetImage(defaultImagePath),
            radius: Radius.circular(borderRadius),
            images:images ,
          ),
        ));
  }
}
