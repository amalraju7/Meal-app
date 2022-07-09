import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
Function setFilters;
Map<String,bool> filters;
FilterScreen(this.setFilters,this.filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.filters['gluten'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
    _vegan= widget.filters['vegan'] as bool;
    _lactoseFree = widget.filters['lactose'] as bool;

    super.initState();

  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
     Function updateValue,
  ) {

    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: (newValue) { updateValue(newValue);},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [IconButton(onPressed: (){widget.setFilters({'gluten':_glutenFree,'lactose':_lactoseFree,'vegetarian':_vegetarian,'vegan':_vegan});}, icon: Icon(Icons.save),)],
      ),
      drawer: MainDrawer(),

      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
