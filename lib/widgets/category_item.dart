import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:travel_app/screens/category_tripes_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryItem({required this.id,required this.title, required this.imageUrl});

  void selectCategoryItem(context){
    Navigator.of(context).pushNamed(
      CategoryTripsScreen.screenRoute,arguments: {
        'id':id,
        'title':title,
    }
   );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCategoryItem(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageUrl,
                   height: 250,
                   fit: BoxFit.cover,
              ),
              // child: Image.network(imageUrl,
              //   height: 250,
              //   fit: BoxFit.cover,
              // ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(title,
              style: Theme.of(context).textTheme.headline6,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
