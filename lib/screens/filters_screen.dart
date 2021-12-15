import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {


  static const routeScreen = '/filters';

  final dynamic saveFilter;
  final Map<dynamic,dynamic> currentFilters;

   FiltersScreen(this.currentFilters ,this.saveFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _Summer = false;
  bool _Winter = false;
  bool _Family = false;

  @override
  void initState() {
    _Summer = widget.currentFilters['summer'];
    _Winter = widget.currentFilters['winter'];
    _Family = widget.currentFilters['family'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
        actions: [IconButton(
          onPressed: (){
            final selectFilters ={
              'summer':_Summer ,
              'winter':_Winter ,
              'family':_Family ,
            };
            widget.saveFilter(selectFilters);
          },
          icon: Icon(Icons.save,),
        ),],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 50,),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'الرحلات الصيفية',
                    'إظهار الرحلات في فصل الصيف فقط',
                    _Summer,
                    (value){
                      setState(() {
                        _Summer = value;
                      });
                    }
                ),
                buildSwitchListTile(
                    'الرحلات الشتوية',
                    'إظهار الرحلات في فصل الشتاء فقط',
                    _Winter,
                        (value){
                      setState(() {
                        _Winter = value;
                      });
                    }
                ),
                buildSwitchListTile(
                    'للعائلات',
                    'إظهار الرحلات التي للعائلات فقط',
                    _Family,
                        (value){
                      setState(() {
                        _Family = value;
                      });
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchListTile(String title, String subTitle,
      var currentValue,Function(bool value)? updateValue){

    return SwitchListTile(
      title: Text(title,style: TextStyle(
        color: Colors.black,
        fontFamily: 'Elmessiri',
        fontSize: 20         ,
        fontWeight: FontWeight.bold,
      ),),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
