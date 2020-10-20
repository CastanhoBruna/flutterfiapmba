import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';
import 'costs_detail_screen.dart';
import 'gastos.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Escape Trapp',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Roteiros Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
      {
        'title': 'Meus Gastos da Viagem',
        // 'screen': GastosPage(),
        'screen': CostsDetailScreen(),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            title: Text('Explorar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Meus Roteiros'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('Meus Gastos'),
          ),
        ],
      ),
    );
  }
}
