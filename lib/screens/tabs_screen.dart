import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/app_drawer.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabScreen extends StatefulWidget {

  final List<Trip> favoriteTrips ;

  const TabScreen(this.favoriteTrips);



  @override
  _TabScreenState createState() => _TabScreenState();
}
class _TabScreenState extends State<TabScreen> {

  int _currentIndex =0;
  late List<Map<String,dynamic>> _screens;

  @override
  void initState() {
    _screens = [
      {
        'Screen':CategoriesScreen(),
        'Title':'تصنيفات الرحلات',
      },
      {
        'Screen':FavoriteScreen(widget.favoriteTrips),
        'Title':'الرحلات المفضلة',
      }
    ];
    super.initState();
  }
  void _selectedItemNav(int index){
    setState(() {
      _currentIndex= index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_currentIndex]['Title'] ),
      ),
      drawer: AppDrawer(),
      body: _screens[_currentIndex]['Screen'] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedItemNav,
        backgroundColor: Theme.of(context).primaryColor,
         selectedItemColor: Theme.of(context).accentColor,
         unselectedItemColor: Colors.white,
         currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard,
            ),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,
            ),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
