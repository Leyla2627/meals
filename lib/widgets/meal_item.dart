import 'package:flutter/material.dart';
import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function toggleLike;
  final Function isFavourite;
  const MealItem({Key? key, required this.meal, required this.toggleLike, required this.isFavourite}) : super(key: key);

  void _goToMealDetails(BuildContext context){
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: meal);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _goToMealDetails(context);
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      width: double.infinity,
                      height: 300,
                      child: Image.asset(meal.imageUrls[0], fit: BoxFit.cover)),
                  Positioned(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      width: 200,
                      color: Colors.black.withOpacity(0.5),
                      child: Text(meal.title, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),),
                    ),
                    bottom: 0,
                    right: 0,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed:() => toggleLike(meal.id),
                  icon: Icon(isFavourite(meal.id) ? Icons.favorite:Icons.favorite_outline,
                    size: 20, color: Colors.black54,)),
                     Text('${meal.preparingTime.toString()} minutes'),
                     Text('\$${meal.price.toString()}')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
