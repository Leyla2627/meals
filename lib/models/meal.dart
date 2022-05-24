class Meal{
  final String id;
  final String title;
  final List<String> imageUrls;
  final String description;
  final List<String> ingridients;
  final int preparingTime;
  final double price;
  final String categoryId;

  Meal({required this.id, required this.title, required this.imageUrls, required this.description, required this.ingridients, required this.preparingTime,
      required this.price, required this.categoryId});
}

class Meals{
  List<Meal> _list=[
    Meal(id:'m1',
        title:"Lavash",
        imageUrls:['assets/images/lavash.jpg', 'assets/images/burger.jpg', 'assets/images/palov.jpg'] ,
        description:"Ajoyib lavash",
        ingridients: ['go`sht', 'pomidor', 'bodring'],
        preparingTime:10,
        price:12.0,
        categoryId:'c1'),
    Meal(id:'m2',
        title:"Burger",
        imageUrls:['assets/images/burger.jpg', 'assets/images/burger.jpg'],
        description:"Ajoyib Burger",
        ingridients: ['go`sht', 'pomidor', 'bodring'],
        preparingTime:15,
        price:15.0,
        categoryId:'c1'),
    Meal(id:'m3',
        title:"Osh",
        imageUrls:['assets/images/palov.jpg', 'assets/images/palov.jpg'],
        description:"Ajoyib Osh",
        ingridients: [],
        preparingTime:10,
        price:20.0,
        categoryId:'c2'),
    Meal(id:'m4',
        title:"Somsa",
        imageUrls:['assets/images/somsa.jpg', 'assets/images/somsa.jpg'],
        description:"Ajoyib Somsa",
        ingridients: [],

        preparingTime:15,
        price:5.0,
        categoryId:'c2'),
    Meal(id:'m5',
        title:"Pizza",
        imageUrls:['assets/images/pizza.jpg', 'assets/images/pizza.jpg'],
        description:"Ajoyib Pizza",
        ingridients: ['go`sht', 'pomidor', 'bodring', 'pishloq'],
        preparingTime:10,
        price:12.0,
        categoryId:'c3'),
    Meal(id:'m6',
        title:"Coca Cola",
        imageUrls:['assets/images/cola.jpg', 'assets/images/cola.jpg'],
        description:"Ajoyib ichimlik",
        ingridients: [],
        preparingTime:1,
        price:1.0,
        categoryId:'c5'),
    Meal(id:'m7',
        title:"Mountain Dew",
        imageUrls:['assets/images/dew.jpg', 'assets/images/cola.jpg'],
        description:"Ajoyib Mountain Dew",
        ingridients: [],
        preparingTime:1,
        price:1.0,
        categoryId:'c5'),
    Meal(id:'m8',
        title:"Cesar",
        imageUrls:['assets/images/sezar.jpg', 'assets/images/cola.jpg'],
        ingridients: ['tovuq go`sht', 'pomidor', 'bodring'],
        description:"Ajoyib Cesar",
        preparingTime:10,
        price:5.0,
        categoryId:'c6')
  ];

  List<Meal> _favourites = [];
  List<Meal> get favourites{
    return _favourites;

  }
  List<Meal> get list{
    return _list;
  }

  void toggleLike(String mealId){
    final mealIndex = _favourites.indexWhere((meal) => meal.id == mealId);
    if(mealIndex<0){
      _favourites.add(list.firstWhere((meal) => meal.id == mealId));
    }
    else {
      _favourites.removeWhere((meal) => meal.id == mealId);
    }

  }
}