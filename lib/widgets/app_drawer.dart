import 'package:flutter/material.dart';
import 'package:travel_app/screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            color: Theme.of(context).accentColor,
            child: Text('دليلك السياحي',
            style: Theme.of(context).textTheme.headline6,
            ),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 20,),

          buildListTile('الرحلات',Icons.card_travel,
               (){
                Navigator.of(context).pushReplacementNamed('/');
               }),
          buildListTile(
              'الفلترة',Icons.filter_list,
                  (){
                Navigator.of(context).pushReplacementNamed(FiltersScreen.routeScreen);
              }),
        ],
      ),
    );
  }

  Widget buildListTile(String title,IconData icon, Function()? onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Elmessiri'
        ),
      ),
      onTap: onTap,
    );
  }
}
