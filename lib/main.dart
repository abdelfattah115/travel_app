import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/category_tripes_screen.dart';
import 'package:travel_app/screens/filters_screen.dart';
import 'package:travel_app/screens/trip_detail_screen.dart';

import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters ={
    'summer':false ,
    'winter':false ,
    'family':false ,
  };

  List<Trip> _availableTrip = Trips_data;

  List<Trip> _favoriteTrips = [];

  void _changeFilter(Map<String, bool> changeFilter){
    setState(() {
      _filters = changeFilter;
      _availableTrip = Trips_data.where((trip) {
        if(_filters['summer'] == true && trip.isInSummer){
          return false;
        }
        if(_filters['winter'] == true && trip.isInWinter){
          return false;
        }
        if(_filters['family'] == true && trip.isForFamilies){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId){
    final existingIndex = _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFavorite(String id){
    return _favoriteTrips.any((trip) =>trip.id== id );

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
        Locale('ar', 'AE'),], // English, no country code

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'Elmessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
        headline5: TextStyle(
          color: Colors.blue,
          fontSize: 24,
          fontFamily: 'Elmessiri',
          fontWeight: FontWeight.bold,
        ),
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'Elmessiri',
            fontWeight: FontWeight.bold,
          ),
      )
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
          '/':(context)=>TabScreen(_favoriteTrips),
          CategoryTripsScreen.screenRoute:(context)=>CategoryTripsScreen(_availableTrip),
          TripDetailScreen.routeScreen: (context) => TripDetailScreen(_manageFavorite,_isFavorite),
          FiltersScreen.routeScreen: (context) => FiltersScreen(_filters,_changeFilter),
      },
    );
  }
}