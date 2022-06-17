import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // final List<Map<String, Object>> _pages = const [
  //   {'page': CategoriesScreen(), 'title': 'Categories'},
  //   {'page': FavouritesScreen(), 'title': 'Favourites'}
  // ];
  // int _selectedPageIndex = 0;
  // void _selectPage(int index) {
  //   setState(() {
  //     _selectedPageIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: TheDrawer(),
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
              ),
            ]),
          ),
          body: TabBarView(children: <Widget>[
            const CategoriesScreen(),
            FavouritesScreen(widget.favouriteMeals),
          ]),
        ));

    // Scaffold(
    //   appBar:
    //       AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String)),
    //   body: _pages[_selectedPageIndex]['page'] as Widget,
    //   bottomNavigationBar: BottomNavigationBar(
    //     onTap: _selectPage,
    //     backgroundColor: Colors.deepOrangeAccent,
    //     unselectedItemColor: Colors.white,
    //     selectedItemColor: Theme.of(context).primaryColor,
    //     currentIndex: _selectedPageIndex,
    //     // type: BottomNavigationBarType.shifting,
    //     items: const [
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.category), label: 'Categories'),
    //       BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
    //     ],
    //   ),
    // );
  }
}
