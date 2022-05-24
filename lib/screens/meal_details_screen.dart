import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/meal-details';

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int activeImageIndex=0;

  @override
  Widget build(BuildContext context) {
    final mealData = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 250.0, viewportFraction: 1, initialPage: activeImageIndex, onPageChanged: (index, reason){setState(() {
                activeImageIndex = index;
              });}),
              items: mealData.imageUrls.map(
                (image) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ));
                },
              ).toList(),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: mealData.imageUrls.map((e) {
                  final imageIndex = mealData.imageUrls.indexOf(e);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: activeImageIndex == imageIndex ? Colors.black : Colors.grey, shape: BoxShape.circle) );
                }).toList()),
            Text(
              "\$${mealData.price}",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Ta'rifi:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(
                        mealData.description,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Card(
                margin: const EdgeInsets.all(15),
                child: ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (ctx, index) {
                      return Text(mealData.ingridients[index]);
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider();
                    },
                    itemCount: mealData.ingridients.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
