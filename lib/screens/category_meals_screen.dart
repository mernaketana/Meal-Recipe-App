import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  String? categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    //We can't use init since at the moment it is executed the context won't have been created
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      categoryTitle = routeArguments['title'];
      final id = routeArguments['id'];
      displayedMeals = widget.availableMeals
          .where((element) => element.categories.contains(id))
          .toList();
      _loadedInitData = true;
    }
  }

  void _remove(String id) {
    setState(() {
      displayedMeals.removeWhere((e) => e.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle as String)),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            id: displayedMeals[index].id,
          );
        }),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
