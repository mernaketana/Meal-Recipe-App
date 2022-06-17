import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //Scaffold(
        // appBar: AppBar(title: const Text('Meals')),
        ///body:
        GridView(
      // builder mode in a grid is used when you want to build a dynamic amount of items or if it's a very long grid and you only want the items visible on the screen to be rendered
      children: <Widget>[
        ...DUMMY_CATEGORIES
            .map((e) => CategoryItem(e.id, e.title, e.color))
            .toList(),
      ],
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ), // slivers are scrollable areas on the screen and grid is scrollable. Grid delegate means that for the grid this takes care about structuring and layouting the grid and this task of providing a layout is delegated away
      // WithMaxCrossAxisExtent means that it's a preconfigured class which allows us to define a maximum width for each grid item and it will create as many columns as we can fit items with that provided width next to each other
      padding: const EdgeInsets.all(25),
    );
  }
}
