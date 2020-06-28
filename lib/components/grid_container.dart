import 'package:flutter/material.dart';
import 'package:hodomstore/services/list_categories_api.dart';

class GridContainer extends StatefulWidget {

  GridContainer({this.album, this.onTap});

  Function onTap;
  Album album;

  @override
  _GridContainerState createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  Function onTap;
  Album album;

  @override
  void initState() {
    onTap = widget.onTap;
    album = widget.album;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 5.0,
        type: MaterialType.button,
        color: Colors.white,
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  placeholder:  'assets/shopping-transparent-animated-gif.gif',

                  image:
                    album.image,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  album.name,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
