import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

import '../app_data.dart';

class CategoryTripsScreen extends StatefulWidget {

  static const screenRoute= '/category-trips';

  final List<Trip> availableTrips;

  const CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {

  late String categoryTitle;
  late List<Trip> displayTrip; 

  @override
  void initState() {

    super.initState();
  }
  @override
  void didChangeDependencies() {
    final routeArgument = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'] as String;
    displayTrip = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  void _removeTrip(String tripId){
    setState(() {
      displayTrip.removeWhere((trip) => trip.id == tripId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context,index)=> TripItem(
            title: displayTrip[index].title, imageUrl: displayTrip[index].imageUrl,
            duration: displayTrip[index].duration, tripType: displayTrip[index].tripType,
            season: displayTrip[index].season,id: displayTrip[index].id,
            //removeItem: _removeTrip,
        ),
        itemCount: displayTrip.length,
      ),
    );
  }
}
