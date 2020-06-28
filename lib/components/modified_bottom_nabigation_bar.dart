import 'package:flutter/material.dart';

class ModifiedBottomBar extends StatefulWidget {
  ModifiedBottomBar(this.itemList);
  List<BottomNavigationBarItem> itemList;

  @override
  _ModifiedBottomBarState createState() => _ModifiedBottomBarState();
}

class _ModifiedBottomBarState extends State<ModifiedBottomBar> {
  String searchValue;
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        elevation: 10.0,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: widget.itemList,
        ));
  }
}
