import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
          child: Text('No favourites added yet - Start adding some!'));
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            id: favouriteMeals[index].id,
          );
        }),
        itemCount: favouriteMeals.length,
      );
    }
  }
}
