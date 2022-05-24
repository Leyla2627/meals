import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favourites;
  final Function toggleLike;
  final Function isFavourite;
  const FavoritesScreen({Key? key, required this.favourites, required this.toggleLike, required this.isFavourite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favourites.length>0 ?
    ListView.builder(
      itemCount: favourites.length,
        itemBuilder: (ctx, index) => MealItem(meal: favourites[index], toggleLike: toggleLike, isFavourite: isFavourite))
    : Text('Sevimlida ovqatlar mavjud emas');
  }
}
