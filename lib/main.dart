import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_details_screen.dart';
import './models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filter) {
    setState(() {
      _filters = filter;
      _availableMeals = DUMMY_MEALS.where((e) {
        if (_filters['gluten']! && !e.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !e.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian']! && !e.isVegetarian) {
          return false;
        }
        if (_filters['vegan']! && !e.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String id) {
    final existingIndex = _favouriteMeals.indexWhere((e) => e.id == id);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((e) => e.id == id));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((e) => e.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Meals',
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (context) =>
            MealDetailsScreen(_toggleFavourite, _isMealFavourite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_setFilters, _filters),
      },
      // onGenerateRoute: (settings){ //when we want to navigate to a named route that isn't there
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (_) => CategoriesScreen());
      // } ,
      onUnknownRoute: (settings) {
        //when flutter fails to load a page with all other measures
        print(settings.arguments);
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.deepOrangeAccent,
          canvasColor: const Color.fromARGB(255, 234, 234, 241),
          fontFamily: 'raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1:
                    const TextStyle(color: Color.fromARGB(255, 3, 0, 12)),
                bodyText2:
                    const TextStyle(color: Color.fromARGB(255, 3, 0, 12)),
                headline6: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'roboto',
                ),
              ),
          appBarTheme: const AppBarTheme(color: Colors.deepOrangeAccent)),
    );
  }
}
