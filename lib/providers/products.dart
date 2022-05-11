import 'package:flutter/foundation.dart';
import 'product.dart';

// we add "with" keyword in class in case we want to add "mix in".
// a "mix in" is similar to extended class, the core difference is
// that you simply merge some properties or some method into the
// existing class. But you don't return your class into and instance
// of that inherited class.

// ChangeNotifier is like an inherited widget which the provider widget
// use behind the scenes while we won't work with it directly. It is simply
// a widget which allow us to establish the communication tunnel
// behind the scene witht he help of the context object that is available
// in every widget.
class Products with ChangeNotifier {
  // when value change it change in private property
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // we use this getter to return value when state change
  List<Product> get items {
    // we use spread operator "..." to return _items as a copy
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}
