import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String color;

  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    final themeOf = Theme.of(context);
    return InkWell(
        // a gesturedetecetor which triggers a ripple effect when it's tapped
        onTap: () => selectCategory(context),
        splashColor: themeOf.primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: Image.network(
                color,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              //can only happen inside a stack
              bottom: 55,
              right: 5,
              left: 8,
              child: Container(
                color: const Color.fromARGB(50, 241, 232, 176),
                width: 20,
                height: 25,
                child: Text(
                  title,
                  style: themeOf.textTheme.headline6,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        )
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //       colors: [color.withOpacity(0.7), color],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight),
        //   borderRadius: BorderRadius.circular(15),
        );
  }
}
