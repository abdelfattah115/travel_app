import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  //final Function? removeItem;

  const TripItem({
    required this.id, required this.title,
    required this.imageUrl, required this.duration,
    required this.tripType, required this.season,//this.removeItem
  });

  String get seasonText {
    switch(season){
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Spring:
        return 'ريبع';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      default:
        return 'غير معروف';
    }
  }
  String get tripTypeText {
    switch(tripType){
      case TripType.Activities:
        return 'أنشطة';
        break;
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
      default:
        return 'غير معروف';
    }
  }

  void selectItem(context){
    Navigator.of(context).pushNamed(TripDetailScreen.routeScreen,
        arguments: id,).then((result) {
          if(result != null){
            //removeItem(result);
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItem(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        elevation: 7,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: ('$imageUrl'),
                    child: Image.network(
                        imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(
                      vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin:Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [0.6,1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today,
                      color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('$duration أيام ',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.wb_sunny,
                      color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text( seasonText,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.family_restroom,
                      color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text( tripTypeText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
