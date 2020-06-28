import 'package:flutter/material.dart';
import 'package:hodomstore/components/grid_container.dart';
import 'package:hodomstore/services/list_categories_api.dart';

class GridViewDynamic extends StatefulWidget {
  GridViewDynamic(this.snapshot);
  AsyncSnapshot<List<Album>> snapshot;
  @override
  _GridViewDynamicState createState() => _GridViewDynamicState();
}

class _GridViewDynamicState extends State<GridViewDynamic> {
  AsyncSnapshot<List<Album>> snapshot;
  @override
  void initState() {
    snapshot = widget.snapshot;
  }

  @override
  Widget build(BuildContext context) {
    //   gridview(AsyncSnapshot<List<Album>> snapshot) {
    return GridView.count(
      shrinkWrap: true,
      //  primary: true,
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      crossAxisCount: MediaQuery.of(context).size.width <= 400.0
          ? 2
          : MediaQuery.of(context).size.width >= 1000.0 ? 5 : 4,
      childAspectRatio: 1.0,

      children: snapshot.data.map(
        (album) {
          return GridContainer(
            album: album,
            onTap: null,
          );
        },
      ).toList(),
    );
  }
}
