import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';
  final Function filter;
  final Map<String, bool> currentFliters;
  const FiltersScreen(this.filter, this.currentFliters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.currentFliters['gluten'] as bool;
    _lactoseFree = widget.currentFliters['lactose'] as bool;
    _vegetarian = widget.currentFliters['vegetarian'] as bool;
    _vegan = widget.currentFliters['vegan'] as bool;
  }

  Widget _buildSwitch(String title, String desc, bool value, Function update) {
    return SwitchListTile(
      value: value,
      onChanged: update as void Function(bool)?,
      title: Text(title),
      subtitle: Text(desc),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TheDrawer(),
      appBar: AppBar(
        title: const Text('Filters'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final Map<String, bool> _filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.filter(_filters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitch('Gluten-Free', 'Only include gluten-free meals.',
                    _glutenFree, (e) {
                  setState(() {
                    _glutenFree = e;
                  });
                }),
                _buildSwitch('Lactose-Free', 'Only include lactose-free meals.',
                    _lactoseFree, (e) {
                  setState(() {
                    _lactoseFree = e;
                  });
                }),
                _buildSwitch(
                    'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                    (e) {
                  setState(() {
                    _vegetarian = e;
                  });
                }),
                _buildSwitch('Vegan', 'Only include vegan meals.', _vegan, (e) {
                  setState(() {
                    _vegan = e;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
