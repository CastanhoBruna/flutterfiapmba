import 'package:flutter/material.dart';
import 'package:flutterprojectfiap/screens/firebasetest_screen.dart';
import 'package:flutterprojectfiap/screens/push_notifications_screen.dart';
import 'package:flutterprojectfiap/screens/wifi_screen.dart';

import 'screens/maps_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/costs_detail_screen.dart';
import 'screens/gastos.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';

import 'utils/app_routes.dart';
import 'models/meal.dart';
import 'models/settings.dart';
import 'data/dummy_data.dart';

// import 'dart:io';
// import 'dart:async';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override


  void initState() {
    PushNotificationsManager firebaseMessaging = new PushNotificationsManager();
    firebaseMessaging.init();

  }

  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escape Trapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.tealAccent,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(227, 222, 216, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
        AppRoutes.COSTS_DETAIL: (_) => CostsDetailScreen(),
        AppRoutes.MAPS: (_) => MapUnitScreen(),
        AppRoutes.ABOUT: (_) => AboutScreen(),
        AppRoutes.WIFI: (_) => WifiScreen(),
        AppRoutes.FIREBASE: (_) => FirebaseScreen(),
        // AppRoutes.PUSH: (_) => PushNotificationScreen(),
      },
    );
  }















  
}
