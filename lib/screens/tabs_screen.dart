import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../models/category_model.dart';
import '../screens/categories_screen.dart';

import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Category> categories;
  final Meals mealsModel;
  final Function toggleLike;
  final Function isFavourite;

   TabsScreen({Key? key, required this.categories, required this.mealsModel, required this.toggleLike, required this.isFavourite}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  var tabindex = 0 ;

   List<Map<String, dynamic>> _pages = [];

   void _changeTab(int index){
     setState(() {
       tabindex = index;
     });
   }


  @override
  void initState() {
    super.initState();
    _pages = [{
      'page': CategoriesScreen(categories: widget.categories, meals: widget.mealsModel.list),
      'title': "Ovqatlar Menyusi"},
      {'page': FavoritesScreen(favourites: widget.mealsModel.favourites, toggleLike: widget.toggleLike, isFavourite: widget.isFavourite),
        'title': "Sevimli ovqatlar"}];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[tabindex]['title']), centerTitle: true,),
      body: _pages[tabindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: tabindex,
        onTap: _changeTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz,), label: "Barchasi"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,), label: "Sevimli")
        ],
      ),
    )
      ;
  }
}
/*
DefaultTabController(length: 2, initialIndex: 0, child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ovqatlar menyusi'),
        bottom: const TabBar(tabs: [
          Tab(icon: Icon(Icons.more_horiz), text: "Barchasi",),
          Tab(icon: Icon(Icons.favorite), text: "Sevimli",)
        ],),
      ),
      body:  TabBarView(
        children: [
          CategoriesScreen(categories: categories,meals: meals,),
          FavoritesScreen()
        ],
      ),
    ))


 */
