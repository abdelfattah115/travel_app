import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';

class TripDetailScreen extends StatelessWidget {

  static const routeScreen ='/trip-detail';
  final Function manageFavorite;
  final Function isFavorite;

  const TripDetailScreen(this.manageFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectTrip = Trips_data.firstWhere((trip) => tripId == trip.id );
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectTrip.title}'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: ('${selectTrip.imageUrl}'),
                child: Image.network(
                  selectTrip.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildSectionTitle(context, 'الأنشطة'),
            buildListViewContainer(
             ListView.builder(
                  itemBuilder: (context, index) => Card(
                    elevation: 0.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Text(selectTrip.activities[index],
                      ),
                    ),
                  ),
                  itemCount: selectTrip.activities.length,
               physics: BouncingScrollPhysics(),
              ),
            ),
            buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemBuilder:(context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).accentColor,
                        child: Text('يوم${index +1}',
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                      ),
                      title: Text(selectTrip.program[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount:  selectTrip.program.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isFavorite(tripId) ? Icons.star : Icons.star_border,
        ),
        onPressed: ()=> manageFavorite(tripId),
      ),
    );
  }
  Widget buildSectionTitle(context,String title) => Container(
    alignment: Alignment.topRight,
    margin:EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    child: Text(title,
      style: Theme.of(context).textTheme.headline5,
    ),
  );

  Widget buildListViewContainer(Widget child) => Container(
  decoration: BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(10),
  ),
  height: 200,
  padding: EdgeInsets.all(10),
  margin: EdgeInsets.symmetric(horizontal: 10),
    child: child,
  );
}
