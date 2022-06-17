import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class TheDrawer extends StatelessWidget {
  const TheDrawer({Key? key}) : super(key: key);

  Widget buildDrawerItem(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'roboto', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              color: Theme.of(context).accentColor,
              height: 90,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Cooking Up!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 26,
                  color: Colors.white,
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          buildDrawerItem('Meals', Icons.restaurant_menu,
              (() => Navigator.of(context).pushReplacementNamed('/'))),
          buildDrawerItem(
              'Filters',
              Icons.settings,
              (() => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName))),
        ],
      ),
    );
  }
}
