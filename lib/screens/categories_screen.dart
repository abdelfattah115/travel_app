import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 7 / 8,
        ),
        children: Categories_data.map((categoriesData) =>
            CategoryItem(
              title: categoriesData.title,
              imageUrl: categoriesData.imageUrl,
              id: categoriesData.id,)).toList(),
    );
  }
}
