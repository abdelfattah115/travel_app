import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Trip> favoriteTrips;

  const FavoriteScreen(this.favoriteTrips);


  @override
  Widget build(BuildContext context) {
    if(favoriteTrips.isEmpty){
      return Center(
          child: Text(
            'ليس لديك أي رحلة في قائمة المفضلة',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Elmessiri'
            ),
            ));
    }else{
      return ListView.builder(
        itemBuilder: (context,index)=> TripItem(
          title: favoriteTrips[index].title, imageUrl: favoriteTrips[index].imageUrl,
          duration: favoriteTrips[index].duration, tripType: favoriteTrips[index].tripType,
          season: favoriteTrips[index].season,id: favoriteTrips[index].id,
          //removeItem: _removeTrip,
        ),
        itemCount: favoriteTrips.length,
      );
    }

  }
}
