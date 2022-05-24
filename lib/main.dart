import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import '../models/meal.dart';
import '../screens/category_meals_screen.dart';
import 'models/category_model.dart';

void main() {
  runApp(const App());
}
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _categoryModel = Categories();

  final _mealModel = Meals();

  void _toggleLike (String mealId) {
    setState(() {
      _mealModel.toggleLike(mealId);
    });
  }

  bool _isFavourite(String mealId){
    return _mealModel.favourites.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // home:,
      routes: {
        '/': (ctx) => TabsScreen(categories: _categoryModel.list, mealsModel: _mealModel, toggleLike: _toggleLike, isFavourite: _isFavourite),
        CategoryMealsScreen.routeName : (cxt) => CategoryMealsScreen( toggleLike: _toggleLike, isFavourite:_isFavourite),
        MealDetailsScreen.routeName : (cxt) => MealDetailsScreen(),
      },
    );
  }
}

