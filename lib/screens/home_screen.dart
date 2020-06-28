import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodomstore/constants.dart';
import 'package:hodomstore/components/modified_bottom_nabigation_bar.dart';
import 'package:hodomstore/components/carousel.dart';
import 'package:flutter/services.dart';
import 'package:hodomstore/services/list_categories_api.dart';
import 'dart:async';
import 'package:hodomstore/components/dynamic_grid_view.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchValue;
  CategoriesApi api = CategoriesApi();
  Album album;
  StreamController<int> streamController = StreamController<int>();


  void initState() {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        bottomNavigationBar: ModifiedBottomBar(
          <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              //icon: Image.asset('assets/bottom-bar-icons/more@3x.png'),
              icon: Icon(Icons.more_horiz),
              title: Text('المزيد'),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/bottom-bar-icons/Requests@3x.png')),
              //    icon: Icon(Icons.local_shipping ),
              title: Text('الطلبات'),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/bottom-bar-icons/basket-icon@3x.png')),
              // icon: Icon(Icons.shopping_basket),
              title: Text('السلة'),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/bottom-bar-icons/Home-icon@3x.png')),
              //icon: Icon(Icons.home),
              title: Text('الرئيسية'),
            ),
          ],
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Material(
                color: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  textAlign: TextAlign.end,
                  cursorColor: Colors.black,
                  onChanged: (_value) {
                    _searchValue = _value;
                  },
                  decoration: transparentDecorationTextField,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SetCarousel(
                [
                  NetworkImage(
                      'http://media.innovitics.com/projects/December2019/3khg7HlM9G05rBF44wbq.png'),
                  NetworkImage('https://innovitics.com/assets/img/team.png'),
                  ExactAssetImage("assets/Advertising.jpg")
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                child: FutureBuilder<List<Album>>(
                  future: api.fetchAlbum(),

                  builder: (context, snapshot) {
                    // no setState here
                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      streamController.sink.add(snapshot.data.length);
                      // gridView
                      GridViewDynamic gridView = GridViewDynamic(snapshot);
                      return gridView;
                    }else{
                    return  circularProgress();
                    }
                  },
                ),
              ),
            ),
          ],
        )));
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }
}
