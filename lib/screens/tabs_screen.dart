import 'package:flutter/material.dart';
import 'package:flutterprojectfiap/screens/wifi_screen.dart';
import 'package:flutterprojectfiap/utils/app_routes.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';
import 'costs_detail_screen.dart';
import 'gastos.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';
import '../utils/app_routes.dart';

 

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
          
         actions: <Widget>[
          IconButton(icon: Icon(
            // Icons.attach_money, 
            Icons.wifi, 
            ), 
            // onPressed: ()=> print("teste connectividade "),
            onPressed: ()=> WifiScreen,
          // onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.CostsDetailScreen), 
          // onPressed: () => CostsDetailScreen, 

          )   
            ],
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
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Roteiros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Gastos',
          ),
        ],
      ),
    );
  }
}
