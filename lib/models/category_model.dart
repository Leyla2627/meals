class Category {
  final String id;
  final String title;
  final String imageURL;

  const Category({
    required this.id,
    required this.title,
    required this.imageURL
});
}

class Categories{
  List <Category> _list=[
    Category(id: 'c1', title: 'Fast Food', imageURL: 'assets/images/fast_food.jpg'),
    Category(id: 'c2', title: 'Milliy taomlar', imageURL: 'assets/images/milliy.jpg'),
    Category(id: 'c3', title: 'Italya Taomlari', imageURL: 'assets/images/pizza.jpg'),
    Category(id: 'c4', title: 'Disertlar', imageURL: 'assets/images/disert.jpg'),
    Category(id: 'c5', title: 'Ichimliklar', imageURL: 'assets/images/ichimlik.jpg'),
    Category(id: 'c6', title: 'Saladlar', imageURL: 'assets/images/salad.jpg'),
    Category(id: 'c7', title: 'Fransuz taomlari', imageURL: 'assets/images/french.jpg')

  ];

  List<Category> get list {
    return _list;
  }

}